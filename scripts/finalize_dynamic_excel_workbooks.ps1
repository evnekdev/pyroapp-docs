[CmdletBinding()]
param(
    [string]$InstalledXll = 'C:\Program Files\PYROAPP\x64\PYROAPP-AddIn64-packed.xll',

    [ValidateSet('all', '01', '02', '03')]
    [string]$Workbook = 'all'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$workbookDirectory = Join-Path $repoRoot 'docs\tutorial-assets\workbooks'
$dataDirectory = Join-Path $repoRoot 'docs\tutorial-assets\datafiles\examples'

# Keep the array anchors in source control.  Excel COM writes Formula2 metadata that
# modern Excel needs for a true dynamic-array formula; openpyxl can create the
# workbook layout but cannot create that metadata.
$workbooks = @(
    @{
        Name = '01_PyroApp_Getting_Started_Ca-Zn-O.xlsx'
        Datafile = 'Ca-Zn-O.dat'
        Anchors = @(
            @('Explore', 'A5'), @('Explore', 'C5'), @('Explore', 'E5'), @('Explore', 'G5'), @('Explore', 'I5'), @('Explore', 'K5'),
            @('Basis + utilities', 'E7'), @('Basis + utilities', 'D14'), @('Basis + utilities', 'E30'), @('Basis + utilities', 'E37'), @('Basis + utilities', 'E44'), @('Basis + utilities', 'I9'),
            @('First equilibrium', 'H7'), @('Equilibrium', 'H7'), @('Temperature sweep', 'H7'), @('Phase selection', 'H7'), @('Phase target', 'K7')
        )
    },
    @{
        Name = '02_PyroApp_DAT_Inspection_and_Editing_Ca-Zn-O.xlsx'
        Datafile = 'Ca-Zn-O.dat'
        Anchors = @(
            @('Browse', 'A5'), @('Browse', 'C5'), @('Browse', 'E5'), @('Browse', 'G5'),
            @('Browse', 'B32'), @('Browse', 'E32'), @('Browse', 'H32'),
            @('Interactions', 'B6'), @('Interactions', 'B29')
        )
    },
    @{
        Name = '03_PyroApp_Optimization_Workflows.xlsx'
        Datafile = 'Ca-Zn-O.dat'
        Anchors = @(
            @('Synthetic regression', 'C26'), @('Synthetic regression', 'C28'), @('Synthetic regression', 'C33'),
            @('Parameters', 'B5'), @('Live targets', 'H8'), @('Live regression', 'B15'), @('Live regression', 'B17')
        )
    }
)

if ($Workbook -ne 'all') {
    $workbooks = @($workbooks | Where-Object { $_.Name.StartsWith($Workbook + '_') })
}

if (-not (Test-Path -LiteralPath $InstalledXll -PathType Leaf)) {
    throw "Installed PyroApp XLL not found: $InstalledXll"
}

$stagedDatafiles = @()
foreach ($datafile in @($workbooks.Datafile | Select-Object -Unique)) {
    $source = Join-Path $dataDirectory $datafile
    $destination = Join-Path $workbookDirectory $datafile
    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) { throw "Example DAT missing: $source" }
    if (Test-Path -LiteralPath $destination) { throw "Refusing to overwrite an existing sibling DAT: $destination" }
    Copy-Item -LiteralPath $source -Destination $destination
    $stagedDatafiles += $destination
}

$excel = $null
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    if (-not $excel.RegisterXLL($InstalledXll)) { throw "Excel could not register installed PyroApp XLL: $InstalledXll" }
    # Assigning each Formula2 cell while Excel is automatic would solve every
    # table repeatedly.  Write all anchors first, then evaluate the workbook
    # once against the installed add-in.

    foreach ($entry in $workbooks) {
        $path = Join-Path $workbookDirectory $entry.Name
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Generated workbook missing: $path" }
        $book = $null
        try {
            $book = $excel.Workbooks.Open($path, 0, $false)
            $excel.Calculation = -4135 # xlCalculationManual
            foreach ($anchor in $entry.Anchors) {
                $cell = $book.Worksheets.Item($anchor[0]).Range($anchor[1])
                $formula = $cell.Formula
                if ($formula -notlike '=XLL_*') { throw "$($entry.Name) $($anchor[0])!$($anchor[1]) is not an XLL formula anchor." }
                $cell.Formula2 = $formula
            }
            $excel.Calculation = -4105 # xlCalculationAutomatic
            $excel.CalculateFullRebuild()
            Start-Sleep -Seconds 4
            foreach ($anchor in $entry.Anchors) {
                $cell = $book.Worksheets.Item($anchor[0]).Range($anchor[1])
                if ("$($cell.Value2)" -like '#PYROAPP_ERROR*') { throw "$($entry.Name) $($anchor[0])!$($anchor[1]) failed: $($cell.Value2)" }
                $spill = $cell.SpillingToRange
                if ($null -eq $spill) { throw "$($entry.Name) $($anchor[0])!$($anchor[1]) did not produce a dynamic spill." }
                Write-Output ("{0} {1}!{2} -> {3}" -f $entry.Name, $anchor[0], $anchor[1], $spill.Address($false, $false))
            }
            $fixedRowHeights = @{}
            foreach ($sheet in @($book.Worksheets)) {
                $heights = @{}
                for ($row = 1; $row -le $sheet.UsedRange.Rows.Count; $row++) {
                    $height = [double]$sheet.Rows.Item($row).RowHeight
                    if ($height -gt 15.01) { $heights[$row] = $height }
                }
                $fixedRowHeights[$sheet.Name] = $heights
                $sheet.UsedRange.Columns.AutoFit() | Out-Null
                $sheet.UsedRange.Rows.AutoFit() | Out-Null
            }
            foreach ($sheet in @($book.Worksheets)) {
                foreach ($row in $fixedRowHeights[$sheet.Name].Keys) {
                    $sheet.Rows.Item([int]$row).RowHeight = $fixedRowHeights[$sheet.Name][$row]
                }
            }
            $book.Save()
            $excel.Calculation = -4135 # xlCalculationManual for the next workbook
        }
        finally {
            if ($null -ne $book) { $book.Close($false) }
        }
    }
}
finally {
    if ($null -ne $excel) {
        $excel.Quit()
        [void][Runtime.InteropServices.Marshal]::ReleaseComObject($excel)
    }
    foreach ($path in $stagedDatafiles) {
        if (Test-Path -LiteralPath $path -PathType Leaf) { Remove-Item -LiteralPath $path -Force }
    }
}
