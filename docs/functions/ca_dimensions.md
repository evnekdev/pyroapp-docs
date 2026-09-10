# XLL_CA_DIMENSIONS

**Availability:** stable, open-DAT only.

Returns structural counts from an open ChemSage/ChemApp DAT file. Unlike the runtime information functions, this operation is handled by the local DAT parser and is unaffected by IPC/gRPC selection.

## Syntax

```excel
=XLL_CA_DIMENSIONS(datafile,[update_token])
```

## Returns

A two-column spill range containing the current parser-exposed counts:

- `number_system_components`
- `number_phases`
- `number_phase_constituents`

## Example

```excel
=XLL_CA_DIMENSIONS($B$1)
```

`.CST` and `.BIN` are not supported by this inspection function. Use [`XLL_CA_DIMENSIONS_MAX`](ca_dimensions_max.md) for native runtime limits.