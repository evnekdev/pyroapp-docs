# Runtime transport controls

Transport controls select where **ChemApp runtime work**, especially `XLL_CA_CALCULATE`, executes. DAT LIST/GET/SET functions remain local regardless of this setting.

## Show the active transport

```excel
=XLL_PYROAPP_TRANSPORT()
```

Returns `IPC` or `gRPC` according to the active process configuration.

## Configure the connection

Use the **PyroApp** Ribbon tab's **Connection** group. Choose **Local (IPC)** or **Remote (gRPC)**; for remote mode enter the `http://` or `https://` server address, use **Test Connection**, then choose **Apply**.

Local IPC uses the licensed ChemApp worker on the same computer as Excel. Remote gRPC sends `XLL_CA_CALCULATE` work to the selected server.

The setting applies to the whole Excel/PyroApp process, is saved per user in `%LOCALAPPDATA%\PyroApp\settings.json`, and never changes a workbook. Applying a new destination changes the asynchronous execution identity of subsequent runtime formulas.

## Compatibility formulas

`XLL_PYROAPP_USE_IPC()` and `XLL_PYROAPP_USE_GRPC(...)` remain registered so legacy workbooks open, but they are deprecated and do not change the connection. `XLL_PYROAPP_GRPC_ADDRESS()` returns the configured address; its optional legacy argument is ignored.

Read it:

```excel
=XLL_PYROAPP_GRPC_ADDRESS()
```

!!! note "Scope"
    The Ribbon configures the current Excel/PyroApp process. It is not a thermodynamic condition and does not alter the contents of a DAT file.

!!! warning "Network access"
    A non-local gRPC endpoint must be configured and authorized by the server operator. Do not expose a PyroApp server to an untrusted network merely by binding it to all interfaces.
