# XLL_CA_LIST_INTERACTIONS_M

**Availability:** stable for model families exposed by the current DAT parser.

Lists magnetic interaction participants for the requested solution phases.

## Syntax

```excel
=XLL_CA_LIST_INTERACTIONS_M(datafile,phases,[update_token])
```

## Returns

A one-column spill range of parser-derived magnetic interaction identities/descriptions.

Use these values as the `interactions` argument of `XLL_CA_GET_INTERACTIONS_PARAMETERS_M` and `XLL_CA_SET_INTERACTION_PARAMETERS_M` rather than reconstructing names manually.

This is an open-DAT operation; CST parameter inspection is not supported.