# Tutorial: remote gRPC calculations

Remote mode lets Excel send `XLL_CA_CALCULATE` jobs to a machine that owns a pool of ChemApp workers.

## Select the server

```excel
=XLL_PYROAPP_USE_GRPC("http://server-name:50051")
```

Confirm:

```excel
=XLL_PYROAPP_TRANSPORT()
```

## What is sent

For a remote `XLL_CA_CALCULATE`, PyroApp identifies the current datafile by content and format. If that exact version is not already in the server's temporary cache, it uploads the file. The server validates the synchronized copy and gives workers a server-local path.

Changing the file creates a new content identity. Reusing an unchanged file normally avoids a second upload.

## What is not sent

The local DAT functions remain local:

- `XLL_CA_LIST_*`
- `XLL_CA_GET_*`
- `XLL_CA_SET_*`
- DAT-based `XLL_CA_DIMENSIONS`

Changing the transport to gRPC does not turn these into remote database operations.

## Cache lifetime

The current server has an inactivity-based temporary cache policy configured by its operator. Active calculations retain a lease so cleanup cannot remove the file while a worker is using it.

## Multiple workers

The server queues work onto isolated ChemApp processes. Calculation rows can be strongly uneven in execution time, so the architecture favors dynamic assignment of independent work and always restores the original row order in the returned Excel matrix.

## If the server is unreachable

Switch back to local IPC if you have a local licensed runtime:

```excel
=XLL_PYROAPP_USE_IPC()
```

Otherwise contact the server operator. PyroApp does not automatically route a failed remote request to a different unconfigured server.
