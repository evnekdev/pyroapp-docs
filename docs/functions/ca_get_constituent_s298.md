# XLL_CA_GET_CONSTITUENT_S298

**Availability:** stable, open-DAT only.

Returns standard entropies at 298.15 K for solution-phase constituents/endmembers, independent of DAT thermochemical storage representation.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_S298(datafile,phases,constituents,[update_token])
```

`phases` and `constituents` are paired arrays of equal length.

## Returns

One value per requested pair. Gibbs-form records are differentiated analytically, so S298 is available with the same logical meaning as in legacy ChemApp/PyroApp.