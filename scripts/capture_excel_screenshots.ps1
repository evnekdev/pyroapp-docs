[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$OutputPath,

    [string]$TitleContains = 'Excel',

    [int]$WindowIndex = 0
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not ('PyroApp.ExcelWindowCapture' -as [type])) {
    Add-Type @'
using System;
using System.Runtime.InteropServices;

namespace PyroApp {
    public static class ExcelWindowCapture {
        [StructLayout(LayoutKind.Sequential)]
        public struct RECT { public int Left; public int Top; public int Right; public int Bottom; }

        [DllImport("user32.dll")]
        public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);

        [DllImport("user32.dll")]
        public static extern bool SetForegroundWindow(IntPtr hWnd);

        [DllImport("user32.dll")]
        public static extern bool BringWindowToTop(IntPtr hWnd);

        [DllImport("user32.dll")]
        public static extern bool ShowWindow(IntPtr hWnd, int command);

        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool PrintWindow(IntPtr hWnd, IntPtr hdcBlt, uint flags);
    }
}
'@
}

$windows = @(Get-Process -Name EXCEL -ErrorAction SilentlyContinue |
    Where-Object { $_.MainWindowHandle -ne 0 -and $_.MainWindowTitle -like "*$TitleContains*" } |
    Sort-Object Id)

if ($windows.Count -eq 0) {
    throw "No visible Excel window title contains '$TitleContains'. Open the prepared workbook, select the formula anchor, and retry."
}
if ($WindowIndex -lt 0 -or $WindowIndex -ge $windows.Count) {
    throw "WindowIndex $WindowIndex is outside the $($windows.Count) matching Excel window(s)."
}

$window = $windows[$WindowIndex]
$handle = $window.MainWindowHandle
if ($handle -eq 0) {
    throw "The selected Excel process has no visible main window."
}
[PyroApp.ExcelWindowCapture]::ShowWindow($handle, 9) | Out-Null # SW_RESTORE
[PyroApp.ExcelWindowCapture]::BringWindowToTop($handle) | Out-Null
[PyroApp.ExcelWindowCapture]::SetForegroundWindow($handle) | Out-Null
Start-Sleep -Milliseconds 500

$rect = New-Object PyroApp.ExcelWindowCapture+RECT
if (-not [PyroApp.ExcelWindowCapture]::GetWindowRect($handle, [ref]$rect)) {
    throw "Could not read the Excel window bounds."
}

$width = $rect.Right - $rect.Left
$height = $rect.Bottom - $rect.Top
if ($width -le 0 -or $height -le 0) {
    throw "Excel returned invalid window bounds ${width}x${height}."
}

$destination = [System.IO.Path]::GetFullPath($OutputPath)
$directory = [System.IO.Path]::GetDirectoryName($destination)
[System.IO.Directory]::CreateDirectory($directory) | Out-Null

Add-Type -AssemblyName System.Drawing
$image = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($image)
try {
    $hdc = $graphics.GetHdc()
    try {
        if (-not [PyroApp.ExcelWindowCapture]::PrintWindow($handle, $hdc, 2)) {
            throw "Windows could not render the selected Excel window for capture."
        }
    }
    finally {
        $graphics.ReleaseHdc($hdc)
    }
    $image.Save($destination, [System.Drawing.Imaging.ImageFormat]::Png)
}
finally {
    $graphics.Dispose()
    $image.Dispose()
}

Write-Output "Captured '$($window.MainWindowTitle)' to $destination"
