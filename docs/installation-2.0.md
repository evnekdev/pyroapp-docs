# Install PyroApp

PyroApp is distributed as an architecture-matched Excel XLL package. A normal user does **not** need Python, Cargo, Rust, Visual Studio, or the PyroApp source code.

## Choose the correct package

Excel and the PyroApp XLL must have matching bitness:

| Excel | Client package |
|---|---|
| 64-bit Microsoft Excel | PyroApp x64 |
| 32-bit Microsoft Excel | PyroApp x86 |

In Excel, open **File → Account → About Excel** to check the installed bitness.

!!! warning "Do not mix 32-bit and 64-bit components"
    The XLL, local worker, and ChemApp runtime must have matching architecture. The installer detects Excel bitness and stops on a mismatch.

## Interactive installer

Use the `PyroApp-<version>-x64-Setup.exe` or `PyroApp-<version>-x86-Setup.exe` package that matches Excel. **All users is the required default selection** and installs the shared payload under `%ProgramFiles%\PyroApp`; approve the Windows elevation prompt. Current user remains an explicit alternative for exceptional per-user installations and uses `%LOCALAPPDATA%\Programs\PyroApp\x64` or `%LOCALAPPDATA%\Programs\PyroApp\x86`. The installer shows the scope choice on every launch and does not reuse an older choice silently.

For the normal bundled installer, the wizard:

1. detects the installed Excel executable and verifies bitness;
2. checks for the matching Microsoft .NET Desktop Runtime 8.x and explains the prerequisite before changing the machine;
3. requires visible Excel windows to be closed normally;
4. detects remaining background Excel processes in the current Windows session and asks before terminating them;
5. installs its matched ChemApp runtime under the PyroApp installation;
6. records the fixed bundled runtime location in `pyroapp.runtime.json`;
7. offers to register the XLL for the detected Excel installation (selected by default); and
8. adds documentation and diagnostic shortcuts.

The bundled package does not grant or replace a ChemApp licence, dongle, or protected datafile entitlement. It is distributed only under the applicable ChemApp/GTT licence and organizational authorization. The installer supports upgrade and repair by rerunning the matching package. Uninstall removes only its registration and installed product files; it does not remove another ChemApp installation or unrelated user data.

The background-process prompt lists the affected process IDs. These instances
may be orphaned, but hidden automation can also run without a visible Excel
window. Setup terminates them only after an explicit **Yes**. Choosing **No**
leaves them running and stops installation. Silent setup never terminates Excel.

Run **PyroApp diagnostic** from the Start menu if a runtime problem is reported. The same menu and the PyroApp Ribbon provide **Migrate legacy workbook**, which creates a separate macro-free `.xlsx` file and preserves the original `.xlsm`.

### External ChemApp/developer installer

`PyroApp-<version>-<architecture>-ExternalChemApp-Setup.exe` is an advanced package that contains no ChemApp DLLs. Its wizard asks for an existing licensed ChemApp runtime folder containing `chemapp_00.dll` and verifies its bitness before writing the external runtime path to `pyroapp.runtime.json`. Use it only when an externally managed ChemApp installation is intentional.

!!! note "Microsoft .NET Desktop Runtime"
    The packed XLL requires the matching Microsoft .NET Desktop Runtime 8.x.
    The installer detects a missing runtime and stops with an actionable
    message; it does not rely on a developer .NET installation or a repository
    checkout.

## Portable ZIP

The portable ZIP contains the same architecture-specific XLL, worker, DAT ABI DLL, `RELEASE-MANIFEST.json`, checksum information, and `README-FIRST.txt`. Extract the entire folder to a stable location and load the packed XLL manually. A bundled portable package keeps its `ChemApp` directory intact and uses that directory; an external package requires `PYROAPP_CHEMAPP_HOME` or `pyroapp.runtime.json` to identify the existing runtime.

## Manual XLL registration

1. Obtain the approved PyroApp distribution for your Excel bitness.
2. Extract the **entire** package to a stable folder. Do not copy only the `.xll` file; the package contains companion DLL/executable files.
3. In Excel, open **File → Options → Add-ins**.
4. At the bottom choose **Excel Add-ins** and click **Go**.
5. Click **Browse**, select the appropriate packed PyroApp XLL, and enable it.
6. Restart Excel if the add-in was already loaded from another location or version.
7. In a cell, type `=XLL_PYROAPP_TRANSPORT()` to confirm that PyroApp functions are registered.

The x64/x86 release bundle contains architecture-matched local DAT support. The XLL chooses `pyroapprs_dat_abi-x64.dll` or `pyroapprs_dat_abi-x86.dll` according to the Excel process. It starts `pyroapprs-worker-x64.exe` or `pyroapprs-worker-x86.exe` to match that same process and the selected ChemApp runtime.

## Local IPC calculations

IPC is the normal same-computer calculation mode. In the **PyroApp** Ribbon tab, open **Connection**, select **Local (IPC)**, optionally use **Test Connection**, then click **Apply**.

The XLL starts a bounded pool of separate workers on demand. ChemApp is loaded in a worker, not into Excel, which isolates Excel from native-library failures and security mitigations. A worker monitors the Excel process and exits if Excel exits or crashes.

## Remote gRPC calculations

If you have access to a PyroApp server, in the **PyroApp** Ribbon tab choose **Remote (gRPC)**, enter its `http://` or `https://` address, use **Test Connection**, then click **Apply**. The setting is saved for the current Windows user and applies to every workbook open in that Excel process; it does not modify the workbook.

Only `XLL_CA_CALCULATE` sends/synchronizes a datafile to that server. Local DAT LIST/GET/SET operations stay on your computer.

See [Runtime transport controls](runtime-transports.md) and [Remote gRPC calculations](tutorials/remote-grpc.md).

## ChemApp licence and data

PyroApp does not grant or replace a ChemApp licence. A local bundled package uses the matching runtime shipped under controlled authorization; an external local package needs a separately installed compatible licensed runtime. A remote user needs authorization to the configured PyroApp/ChemApp server.

## Current download model

Release packages are approval-controlled. See [Downloads](download.md) for the current distribution status.
