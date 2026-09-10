# XLL_CA_SET_COMPOUND_CP

**Availability:** stable, open-DAT only.

Changes thermochemical coefficients for selected compound ranges.

## Syntax

```excel
=XLL_CA_SET_COMPOUND_CP(datafile,phases,range_indices,value_indices,values,[update_token])
```

For every target phase supply one one-based `range_index` and one `value_index`.

- `value_index = 1..10`: the corresponding row of `values` supplies that public coefficient.
- `value_index = 0`: the corresponding values row must contain exactly ten coefficients and replaces the full public coefficient vector for that range.

## Returns

One Boolean status per phase/edit row.

!!! warning
    The historical `CP` name covers the DAT thermochemical coefficient vector. The physical interpretation depends on the record representation. Inspect the original values and range structure before editing.