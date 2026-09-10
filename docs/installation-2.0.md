# Install PyroApp 2

PyroApp 2 is distributed as an Excel XLL package. A normal user does **not** need Python, Cargo, Rust, Visual Studio, or the PyroApp source code.

## Choose the correct package

Excel and the PyroApp XLL must have matching bitness:

| Excel | Client package |
|---|---|
| 64-bit Microsoft Excel | PyroApp x64 |
| 32-bit Microsoft Excel | PyroApp x86 |

In Excel, open **File → Account → About Excel** to check the installed bitness.

!!! warning "Do not mix 32-bit and 64-bit ChemApp components"
    Local IPC calculations use an isolated ChemApp worker. The worker and ChemApp native library supplied/configured for that package must be mutually compatible. A bitness mismatch prevents the worker from loading ChemApp.

## Install the add-in

1. Obtain the approved PyroApp distribution for your Excel bitness.
2. Extract the **entire** package to a stable folder. Do not copy only the `.xll` file; the package contains companion DLL/executable files.
3. In Excel, open **File → Options → Add-ins**.
4. At the bottom choose **Excel Add-ins** and click **Go**.
5. Click **Browse**, select the appropriate packed PyroApp XLL, and enable it.
6. Restart Excel if the add-in was already loaded from another location or version.
7. In a cell, type `=XLL_PYROAPP_TRANSPORT()` to confirm that PyroApp functions are registered.

The x64/x86 release bundle contains architecture-matched local DAT support. The current implementation chooses `pyroapprs_dat_abi-x64.dll` or `pyroapprs_dat_abi-x86.dll` according to the Excel process.

## Local IPC calculations

IPC is the normal same-computer calculation mode. Select it with:

```excel
=XLL_PYROAPP_USE_IPC()
```

The XLL starts a separate worker process on demand. ChemApp is loaded in the worker, not into Excel, which isolates Excel from native-library failures and security mitigations.

## Remote gRPC calculations

If you have access to a PyroApp server:

```excel
=XLL_PYROAPP_USE_GRPC("http://server-name:50051")
```

Only `XLL_CA_CALCULATE` sends/synchronizes a datafile to that server. Local DAT LIST/GET/SET operations stay on your computer.

See [Runtime transport controls](runtime-transports.md) and [Remote gRPC calculations](tutorials/remote-grpc.md).

## ChemApp licence

PyroApp does not grant or replace a ChemApp licence. A local calculation package needs access to a compatible licensed ChemApp runtime. A remote user needs authorization to the configured PyroApp/ChemApp server.

## Current download model

Release packages are approval-controlled. See [Downloads](download.md) for the current distribution status.
