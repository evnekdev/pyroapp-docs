# XLL_CA_GET_COMPOUND_STOICHIOMETRY

**Availability:** stable, open-DAT only.

Returns selected compound compositions in the DAT system-component basis.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_STOICHIOMETRY(datafile,phases,[update_token])
```

## Returns

A matrix with one row per requested compound and one column per system component, in the same component order returned by `XLL_CA_LIST_COMPONENTS`. A missing compound yields a `NaN` row.