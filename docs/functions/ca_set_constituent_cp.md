# XLL_CA_SET_CONSTITUENT_CP

**Availability:** stable, open-DAT only.

Changes logical heat-capacity coefficients for solution-phase constituents using legacy ChemApp/PyroApp term semantics, for either supported thermochemical storage representation.

## Syntax

```excel
=XLL_CA_SET_CONSTITUENT_CP(datafile,phases,constituents,range_indices,value_indices,values,[update_token])
```

Each target has a paired phase, constituent, one-based range index and coefficient index. `value_index = 1..10` edits the corresponding native ChemApp Cp term; `0` writes the supplied native prefix `1..N`, so ordinary four-term rows need not be padded.

## Returns

A Boolean status array.

The edit is semantic and transactional; PyroApp does not patch DAT text by position. Gibbs-form records are converted analytically for the edit and converted exactly back to their original representation.