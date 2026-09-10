# XLL_CA_CHEMAPPDLLS

**Availability:** stable runtime diagnostic.

Returns the ChemApp native-library paths/specifications visible to the selected runtime implementation.

## Syntax

```excel
=XLL_CA_CHEMAPPDLLS([update_token])
```

## Returns

A one-column dynamic array of library paths or loader specifications.

## Example

```excel
=XLL_CA_CHEMAPPDLLS()
```

This is mainly a configuration/troubleshooting function. Do not edit, rename, or replace licensed native libraries simply to change this output. Local IPC and remote gRPC can describe different runtime environments.

See [ChemApp and licensing](../chemapp.md) and [Runtime transport controls](../runtime-transports.md).