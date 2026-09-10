# XLL_CA_GET_CONSTITUENT_STOICHIOMETRY

**Availability:** stable, open-DAT only.

Returns selected phase-constituent compositions in the DAT system-component basis.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_STOICHIOMETRY(datafile,phases,constituents,[update_token])
```

## Returns

A matrix with one row per `(phase,constituent)` pair and one column per system component, ordered as `XLL_CA_LIST_COMPONENTS`.