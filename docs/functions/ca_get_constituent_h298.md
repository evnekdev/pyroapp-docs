# XLL_CA_GET_CONSTITUENT_H298

**Availability:** stable, open-DAT only.

Returns stored standard enthalpies at 298 K for solution-phase constituents/endmembers.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_H298(datafile,phases,constituents,[update_token])
```

`phases` and `constituents` are paired arrays and must have equal lengths.

## Returns

One value per `(phase,constituent)` pair. A value that is not directly represented in the DAT is returned as `NaN`.

Use [`XLL_CA_LIST_CONSTITUENTS`](ca_list_constituents.md) to obtain valid constituent names.