# XLL_CA_SET_CONSTITUENT_H298

**Availability:** stable, open-DAT only.

Changes stored H298 values for selected solution-phase constituents/endmembers.

## Syntax

```excel
=XLL_CA_SET_CONSTITUENT_H298(datafile,phases,constituents,values,[update_token])
```

`phases`, `constituents`, and `values` are corresponding arrays.

## Returns

One Boolean status per requested edit.

The operation modifies the DAT at the same path only after the complete semantic edit validates successfully.