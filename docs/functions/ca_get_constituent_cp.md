# XLL_CA_GET_CONSTITUENT_CP

**Availability:** stable, open-DAT only.

Reads the logical legacy ChemApp/PyroApp heat-capacity coefficient vector for selected solution-phase constituents, independent of DAT storage representation.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_CP(datafile,phases,constituents,range_indices,value_indices,[update_token])
```

`phases` and `constituents` identify paired targets. `range_indices` are one-based. A `value_index` of `1..10` is the native legacy ChemApp `TQGDAT("Cp")` term number. `0` returns the historical PyroApp grouped ten-value display vector.

## Returns

A numeric matrix. Missing optional Cp terms are zero. Gibbs-form records are differentiated analytically to the same logical Cp representation rather than exposing raw Gibbs coefficients.