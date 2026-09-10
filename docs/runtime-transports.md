# Runtime transport controls

Transport controls select where **ChemApp runtime work**, especially `XLL_CA_CALCULATE`, executes. DAT LIST/GET/SET functions remain local regardless of this setting.

## Show the active transport

```excel
=XLL_PYROAPP_TRANSPORT()
```

Returns `IPC` or `Grpc` according to the active process configuration.

## Use local IPC

```excel
=XLL_PYROAPP_USE_IPC()
```

Use this when the ChemApp worker and its licensed native library are on the same computer as Excel.

## Use gRPC

```excel
=XLL_PYROAPP_USE_GRPC("http://server-name:50051")
```

The address argument is optional; if omitted, PyroApp uses its configured gRPC address.

## Read or change the gRPC address

Read it:

```excel
=XLL_PYROAPP_GRPC_ADDRESS()
```

Set it:

```excel
=XLL_PYROAPP_GRPC_ADDRESS("http://server-name:50051")
```

Changing the transport or address changes the asynchronous execution identity of subsequent runtime formulas.

!!! note "Scope"
    These controls configure the current Excel/PyroApp process. They are not thermodynamic conditions and do not alter the contents of a DAT file.

!!! warning "Network access"
    A non-local gRPC endpoint must be configured and authorized by the server operator. Do not expose a PyroApp server to an untrusted network merely by binding it to all interfaces.
