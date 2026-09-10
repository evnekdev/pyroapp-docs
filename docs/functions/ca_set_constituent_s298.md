# XLL_CA_SET_CONSTITUENT_S298

**Availability:** stable, open-DAT only.

Changes stored S298 values for selected solution-phase constituents/endmembers.

## Syntax

```excel
=XLL_CA_SET_CONSTITUENT_S298(datafile,phases,constituents,values,[update_token])
```

## Returns

A Boolean status array.

Use `XLL_CA_LIST_CONSTITUENTS` to obtain exact constituent names. This is a local parser/editor operation; it does not call ChemApp or upload the DAT.