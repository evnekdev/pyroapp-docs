# XLL_CA_SET_CONSTITUENT_CP

**Availability:** stable, open-DAT only.

Changes thermochemical coefficients for solution-phase constituents.

## Syntax

```excel
=XLL_CA_SET_CONSTITUENT_CP(datafile,phases,constituents,range_indices,value_indices,values,[update_token])
```

Each target has a paired phase, constituent, one-based range index and coefficient index. `value_index = 1..10` edits one public coefficient; `0` requires a complete ten-value row.

## Returns

A Boolean status array.

The edit is semantic and transactional; PyroApp does not patch DAT text by position.