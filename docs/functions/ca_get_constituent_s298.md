# XLL_CA_GET_CONSTITUENT_S298

**Availability:** stable, open-DAT only.

Returns stored standard entropies at 298 K for solution-phase constituents/endmembers.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_S298(datafile,phases,constituents,[update_token])
```

`phases` and `constituents` are paired arrays of equal length.

## Returns

One value per requested pair. `NaN` means that the value is not directly available in the stored thermochemical representation.