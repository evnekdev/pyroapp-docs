# XLL_CA_GET_CONSTITUENT_CP

**Availability:** stable, open-DAT only.

Reads thermochemical coefficient data for selected solution-phase constituents.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_CP(datafile,phases,constituents,range_indices,value_indices,[update_token])
```

`phases` and `constituents` identify paired targets. `range_indices` are one-based. A `value_index` of `1..10` selects one public coefficient; `0` returns the full ten-coefficient display vector for that target/range.

## Returns

A numeric matrix. `NaN` can appear where a requested coefficient is not structurally available from the stored representation.