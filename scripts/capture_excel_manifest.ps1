[CmdletBinding()]
param(
    [string]$Manifest = (Join-Path $PSScriptRoot 'excel-screenshot-manifest.json'),
    [string]$InstalledXll = 'C:\Program Files\PYROAPP\x64\PYROAPP-AddIn64-packed.xll'
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$workbookRoot = Join-Path $repo 'docs\tutorial-assets\workbooks'
$dataRoot = Join-Path $repo 'docs\tutorial-assets\datafiles\examples'
$capture = Join-Path $PSScriptRoot 'capture_excel_screenshots.ps1'
$names = @{
    '01' = @{ Workbook='01_PyroApp_Getting_Started_Ca-Zn-O.xlsx'; Dat='Ca-Zn-O.dat' }
    '02' = @{ Workbook='02_PyroApp_DAT_Inspection_and_Editing_Ca-Zn-O.xlsx'; Dat='Ca-Zn-O_editing_working.dat' }
    '03' = @{ Workbook='03_PyroApp_Optimization_Workflows.xlsx'; Dat='Ca-Zn-O_optimization_working.dat' }
}
$items = @(Get-Content -LiteralPath $Manifest -Raw | ConvertFrom-Json)
function Crop-Capture([string]$Path, [object[]]$Crop) {
    if ($null -eq $Crop) { return }
    Add-Type -AssemblyName System.Drawing
    $image = [System.Drawing.Image]::FromFile($Path)
    try {
        $x = [int]$Crop[0]; $y = [int]$Crop[1]
        $width = [Math]::Min([int]$Crop[2], $image.Width - $x)
        $height = [Math]::Min([int]$Crop[3], $image.Height - $y)
        if ($width -le 0 -or $height -le 0) { throw "Invalid crop for $Path" }
        $bitmap = New-Object System.Drawing.Bitmap($width, $height)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        try { $graphics.DrawImage($image, (New-Object System.Drawing.Rectangle(0,0,$width,$height)), (New-Object System.Drawing.Rectangle($x,$y,$width,$height), [System.Drawing.GraphicsUnit]::Pixel)) }
        finally { $graphics.Dispose() }
        $bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
        $bitmap.Dispose()
    } finally { $image.Dispose() }
}if (-not (Test-Path -LiteralPath $InstalledXll)) { throw "Installed XLL not found: $InstalledXll" }
$staged = @()
$automationBefore = @(Get-CimInstance Win32_Process -Filter "Name = 'EXCEL.EXE'" | Where-Object { $_.CommandLine -match '/automation\s+-Embedding' } | Select-Object -ExpandProperty ProcessId)
$automationOwned = @()
$excel = $null
try {
    foreach ($dat in @($names.Values.Dat | Select-Object -Unique)) {
        $source = Join-Path $dataRoot $dat; $destination = Join-Path $workbookRoot $dat
        Copy-Item -LiteralPath $source -Destination $destination -Force
        $staged += $destination
    }
    $excel = New-Object -ComObject Excel.Application
    Start-Sleep -Milliseconds 300
    $automationOwned = @(Get-CimInstance Win32_Process -Filter "Name = 'EXCEL.EXE'" | Where-Object { $_.CommandLine -match '/automation\s+-Embedding' -and $_.ProcessId -notin $automationBefore } | Select-Object -ExpandProperty ProcessId)
    $excel.Visible = $true
    $excel.DisplayAlerts = $false
    $excel.WindowState = -4137 # maximized
    if (-not $excel.RegisterXLL($InstalledXll)) { throw 'Could not register PyroApp XLL.' }
    foreach ($key in @($items.workbook | Select-Object -Unique)) {
        $book = $null
        try {
            $book = $excel.Workbooks.Open((Join-Path $workbookRoot $names[$key].Workbook), 0, $true)
            foreach ($item in @($items | Where-Object workbook -eq $key)) {
                $sheet = $book.Worksheets.Item($item.sheet)
                $sheet.Activate()
                $sheet.Calculate()
                $window = $excel.ActiveWindow
                $window.Zoom = [int]$item.zoom
                $window.ScrollRow = [int]$item.scrollRow
                $window.ScrollColumn = [int]$item.scrollColumn
                $sheet.Range($item.anchor).Select()
                Start-Sleep -Seconds 2
                $output = Join-Path $repo $item.output
                & $capture -OutputPath $output -TitleContains $book.Name
                if (-not (Test-Path -LiteralPath $output -PathType Leaf)) { throw "Capture did not create $output" }
                Crop-Capture $output @($item.crop)
                Write-Output "$($item.output) :: $($item.caption)"
            }
        } finally {
            if ($null -ne $book) { $book.Close($false); [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($book) }
        }
    }
} finally {
    if ($null -ne $excel) { $excel.Quit(); [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel); [GC]::Collect(); [GC]::WaitForPendingFinalizers() }
    foreach ($excelProcessId in $automationOwned) { if (Get-Process -Id $excelProcessId -ErrorAction SilentlyContinue) { Stop-Process -Id $excelProcessId -Force } }
    foreach ($path in $staged) { Remove-Item -LiteralPath $path -Force -ErrorAction SilentlyContinue }
}
