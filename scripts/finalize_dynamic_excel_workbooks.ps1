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

# openpyxl authors the editable layout. This script is the only maintainer step
# that writes Formula2 metadata and cached values through real desktop Excel.
# It never runs SET: every workbook write gate must be false before calculation.
$workbooks = @(
    @{
        Name = '01_PyroApp_Getting_Started_Ca-Zn-O.xlsx'; Datafile = 'Ca-Zn-O.dat'; WriteGates = @()
        Expectations = @(
            'Explore|A5|spill|1|1', 'Explore|C5|spill|1|1', 'Explore|E5|spill|1|1', 'Explore|G5|spill|1|1', 'Explore|I5|spill|1|1', 'Explore|K5|spill|1|1',
            'Basis + utilities|E7|spill|1|3', 'Basis + utilities|D14|spill|11|3', 'Basis + utilities|E30|spill|1|3', 'Basis + utilities|E37|spill|1|3', 'Basis + utilities|E44|spill|1|3', 'Basis + utilities|I9|spill|1|1',
            'First equilibrium|H7|spill|1|5', 'Equilibrium|H7|spill|11|7', 'Temperature sweep|H7|spill|12|6', 'Phase selection|H7|spill|1|5', 'Phase target|K7|spill|5|4'
        )
    },
    @{
        Name = '02_PyroApp_DAT_Inspection_and_Editing_Ca-Zn-O.xlsx'; Datafile = 'Ca-Zn-O_editing_working.dat'; WriteGates = @('Safe edit|B14')
        Expectations = @(
            'Browse|A5|spill|1|1', 'Browse|C5|spill|1|1', 'Browse|E5|spill|1|1', 'Browse|G5|spill|1|1',
            'Browse|B32|spill|1|1', 'Browse|E32|spill|1|1', 'Browse|H32|spill|1|1', 'Interactions|B6|spill|1|1', 'Interactions|B29|spill|1|6', 'Safe edit|B16|scalar|1|1'
        )
    },
    @{
        Name = '03_PyroApp_Optimization_Workflows.xlsx'; Datafile = 'Ca-Zn-O_optimization_working.dat'; WriteGates = @('Parameters|B15')
        Expectations = @(
            'Synthetic regression|C26|result|1|1', 'Synthetic regression|C28|result|1|1', 'Synthetic regression|C33|result|1|1',
            'Parameters|B5|spill|1|1', 'Parameters|B17|scalar|1|1', 'Parameters|B18|scalar|1|1', 'Live targets|H8|spill|5|2', 'Live regression|B15|result|1|1', 'Live regression|B17|result|1|1'
        )
    }
)

if ($Workbook -ne 'all') {
    $workbooks = @($workbooks | Where-Object { $_.Name.StartsWith($Workbook + '_') })
}
if (-not (Test-Path -LiteralPath $InstalledXll -PathType Leaf)) {
    throw "Installed PyroApp XLL not found: $InstalledXll"
}

function Get-AutomationExcelProcessIds {
    return @(Get-CimInstance Win32_Process -Filter "Name = 'EXCEL.EXE'" | Where-Object { $_.CommandLine -match '/automation\s+-Embedding' } | Select-Object -ExpandProperty ProcessId)
}

function Get-Sha256([string]$Path) {
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
}

function Wait-ForFormulaResults([object]$Book) {
    # PyroApp's asynchronous Excel UDFs can keep Application.CalculationState
    # busy after their required worksheet values are ready.  Sleep only after a
    # worksheet-scoped Calculate, then let explicit anchor validation decide.
    Start-Sleep -Seconds 5
}
function Test-NoPyroAppError([object]$Cell, [string]$Label) {
    $value = [string]$Cell.Value2
    if ($value -match '^#(PYROAPP_ERROR|NAME\?|REF!|SPILL!|VALUE!|CALC!)') {
        throw "$Label evaluated to $value"
    }
}

function Test-Expectation([object]$Book, [object[]]$Expectation) {
    $sheetName, $address, $kind, $minimumRows, $minimumColumns = $Expectation -split '\|'
    $cell = $Book.Worksheets.Item($sheetName).Range($address)
    $label = "$($Book.Name) $sheetName!$address"
    Test-NoPyroAppError $cell $label
    if ($kind -eq 'result') { return }

    $spill = $null
    try { $spill = $cell.SpillingToRange } catch { $spill = $null }
    if ($kind -eq 'spill') {
        if ($null -eq $spill) { throw "$label must produce a dynamic-array spill." }
        if ($spill.Rows.Count -lt $minimumRows -or $spill.Columns.Count -lt $minimumColumns) {
            throw "$label spill $($spill.Address($false,$false)) is smaller than expected minimum ${minimumRows}x${minimumColumns}."
        }
        Write-Output "$label spill $($spill.Address($false,$false))"
        return
    }
    if ($kind -eq 'scalar') {
        if ($null -ne $spill -and ($spill.Rows.Count -ne 1 -or $spill.Columns.Count -ne 1)) {
            throw "$label must be scalar, but spills to $($spill.Address($false,$false))."
        }
        Write-Output "$label scalar $($cell.Value2)"
        return
    }
    throw "$label has unsupported validation kind $kind"
}

$stagedDatafiles = @()
$sourceHashes = @{}
foreach ($datafile in @($workbooks.Datafile | Select-Object -Unique)) {
    $source = Join-Path $dataDirectory $datafile
    $destination = Join-Path $workbookDirectory $datafile
    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) { throw "Working DAT missing: $source" }
    if (Test-Path -LiteralPath $destination) {
        $sourceHash = Get-Sha256 $source
        if ((Get-Sha256 $destination) -ne $sourceHash) { throw "Refusing to overwrite changed workbook-sibling DAT: $destination" }
        Remove-Item -LiteralPath $destination -Force
    }
    $sourceHashes[$source] = Get-Sha256 $source
    Copy-Item -LiteralPath $source -Destination $destination
    $stagedDatafiles += $destination
}

$excel = $null
$automationBefore = @(Get-AutomationExcelProcessIds)
    if ($automationBefore.Count -gt 0) { throw "Refusing to run while hidden Excel automation processes already exist: $($automationBefore -join ', ')." }
$automationOwned = @()
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    for ($attempt = 0; $attempt -lt 30 -and $automationOwned.Count -eq 0; $attempt++) {
        Start-Sleep -Milliseconds 200
        $automationOwned = @(Get-AutomationExcelProcessIds | Where-Object { $_ -notin $automationBefore })
    }
    if (-not $excel.RegisterXLL($InstalledXll)) { throw "Excel could not register installed PyroApp XLL: $InstalledXll" }

    foreach ($entry in $workbooks) {
        $path = Join-Path $workbookDirectory $entry.Name
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Generated workbook missing: $path" }
        $book = $null
        try {
            $book = $excel.Workbooks.Open($path, 0, $false)
            foreach ($gate in $entry.WriteGates) {
                $gateSheet, $gateAddress = $gate -split '\|'
                $gateValue = $book.Worksheets.Item($gateSheet).Range($gateAddress).Value2
                if ($gateValue -eq $true -or $gateValue -eq 1) { throw "$($entry.Name) ${gateSheet}!${gateAddress} enables DAT writes; finalization refuses to calculate it." }
            }

            $excel.Calculation = -4135 # xlCalculationManual
            foreach ($sheet in @($book.Worksheets)) {
                $used = $sheet.UsedRange
                foreach ($cell in $used.Cells) {
                    $formula = [string]$cell.Formula
                    if ($formula -like '=XLL_*') { $cell.Formula2 = $formula }
                }
            }
            $excel.Calculation = -4105 # xlCalculationAutomatic
            foreach ($sheet in @($book.Worksheets)) { $sheet.Calculate() }
            Wait-ForFormulaResults $book

            foreach ($expectation in $entry.Expectations) { Test-Expectation $book $expectation }
            foreach ($gate in $entry.WriteGates) {
                $gateSheet, $gateAddress = $gate -split '\|'
                $postGateValue = $book.Worksheets.Item($gateSheet).Range($gateAddress).Value2
                if ($postGateValue -eq $true -or $postGateValue -eq 1) { throw "$($entry.Name) ${gateSheet}!${gateAddress} write gate changed during calculation." }
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
                foreach ($row in $fixedRowHeights[$sheet.Name].Keys) { $sheet.Rows.Item([int]$row).RowHeight = $fixedRowHeights[$sheet.Name][$row] }
            }
            $book.Save()
        }
        finally {
            if ($null -ne $book) {
                $book.Close($false)
                [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($book)
            }
        }
    }
}
finally {
    if ($null -ne $excel) {
        $excel.Quit()
        [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($excel)
        [GC]::Collect()
        [GC]::WaitForPendingFinalizers()
    }
    foreach ($excelProcessId in $automationOwned) {
        if (Get-Process -Id $excelProcessId -ErrorAction SilentlyContinue) { Stop-Process -Id $excelProcessId -Force }
    }
    foreach ($path in $stagedDatafiles) {
        if (Test-Path -LiteralPath $path -PathType Leaf) {
            $source = Join-Path $dataDirectory (Split-Path -Leaf $path)
            if ((Get-Sha256 $path) -ne $sourceHashes[$source]) { throw "Finalization modified staged DAT: $path" }
            Remove-Item -LiteralPath $path -Force
        }
    }
    foreach ($source in $sourceHashes.Keys) {
        if ((Get-Sha256 $source) -ne $sourceHashes[$source]) { throw "Finalization modified source DAT: $source" }
    }
}
