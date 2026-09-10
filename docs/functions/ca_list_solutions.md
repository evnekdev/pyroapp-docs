# XLL_CA_LIST_SOLUTIONS

**Availability:** stable, open-DAT only.

Lists variable-composition solution/mixture phases.

## Syntax

```excel
=XLL_CA_LIST_SOLUTIONS(datafile,[system],[update_token])
```

`system` is an optional chemical-system filter. Leave it blank to return every solution phase in datafile order.

## Returns

A one-column dynamic array of solution phase names.

For fixed-composition phases use [`XLL_CA_LIST_COMPOUNDS`](ca_list_compounds.md); for both categories use [`XLL_CA_LIST_PHASES`](ca_list_phases.md).