# XLL_CA_SET_COMPOUND_CP

**Availability:** stable, open-DAT only.

Changes logical heat-capacity coefficients for selected compound ranges using legacy ChemApp/PyroApp term semantics. The edit works for both Gibbs-polynomial and H298/S298 + Cp storage.

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
    SET is semantic rather than a raw text patch. If the DAT is Gibbs-form, PyroApp performs the exact thermodynamic conversion needed to apply the requested Cp edit while preserving H298/S298 and returns the record to its original storage form. An edit that cannot be represented exactly fails rather than being fitted approximately.