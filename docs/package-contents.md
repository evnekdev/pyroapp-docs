# PyroApp package contents

This page is the official user-facing inventory of a complete PyroApp package. Builds, installers, repairs, and updates must preserve this inventory. The release pipeline checks the matching machine-readable package contract before producing an installer.

## Installed files

Every x64 or x86 installation contains:

| File or directory | Purpose |
| --- | --- |
| `PYROAPP-PACKAGE-CONTRACT.json` | Machine-readable package and Ribbon contract |
| `README-FIRST.txt` | Installed-package startup instructions |
| `RELEASE-MANIFEST.json` | Version, source commits, architecture, runtime mode, hashes, and file inventory |
| `pyroapp.runtime.json` | Effective local runtime configuration |
| `pyroapp-diagnostic.ps1` | Read-only installation diagnostic |
| `tools/PyroApp-Workbook-Migrator.ps1` | Workbook migrator used by the Ribbon and Start menu |
| packed XLL | Excel worksheet functions and PyroApp Ribbon |
| worker executable | Isolated local calculation worker |
| DAT ABI DLL | Local ChemSage DAT access |
| `ChemApp` | Bundled licensed runtime when the package is a bundled-runtime build |

The architecture-specific binaries are:

| Architecture | Packed XLL | Worker | DAT ABI |
| --- | --- | --- | --- |
| x64 | `PYROAPP-AddIn64-packed.xll` | `pyroapprs-worker-x64.exe` | `pyroapprs_dat_abi-x64.dll` |
| x86 | `PYROAPP-AddIn-packed.xll` | `pyroapprs-worker-x86.exe` | `pyroapprs_dat_abi-x86.dll` |

Bundled packages contain the exact ChemApp DLL inventory recorded in `RELEASE-MANIFEST.json`. External-runtime packages contain no `ChemApp` directory.

The installer creates `unins000.exe` and `unins000.dat` in the installation directory, plus Start-menu shortcuts for documentation, workbook migration, and uninstall. Per-user settings under `%LOCALAPPDATA%\PyroApp` and scratch workspaces under `%TEMP%\PyroApp` are runtime state rather than installed payload files.

## Excel Ribbon

A complete PyroApp Ribbon has three groups:

| Group | Controls |
| --- | --- |
| Connection | Local mode; disabled Remote mode and server controls marked Coming soon; Test Connection; Show last error message; connection status |
| Calculation | Blocking/Async UDF execution selector; **Calculate derivative matrix** |
| Tools / Help | Migrate legacy workbook; Documentation; About PyroApp |

If one of these groups or controls is missing after an update, close every Excel window and any background `EXCEL.EXE` process, then run Repair. Excel loads an XLL and its Ribbon into process memory; an Excel process left running can continue showing an older Ribbon even when newer files have been installed.

## Installer behavior

The interactive installer selects **All users by default**, which installs under `%ProgramFiles%\PyroApp`; Current user remains available as a deliberate alternative. It supports Install or update, Repair current installation, and Uninstall current installation. It checks Excel bitness and the required .NET Desktop Runtime.

Before install, update, repair, or uninstall changes files, setup detects every `EXCEL.EXE` process in the current Windows session:

- A visible Excel window blocks setup and asks you to close Excel normally.
- A background Excel process owned by the current user is shown by process ID. Setup asks before terminating it.
- A process whose owner cannot be verified is shown by process ID and blocks setup. Setup does not terminate it automatically.

This check prevents an old XLL and Ribbon from remaining active across installation.

## Worksheet functions

The browsable [Function reference](function-reference.md) is the user-facing worksheet-function inventory. The source release also runs an API gate that compares documented exports with the XLL exports, so undocumented additions or missing functions fail the release.
