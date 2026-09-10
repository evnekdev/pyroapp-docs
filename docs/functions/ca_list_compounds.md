# XLL_CA_LIST_COMPOUNDS

**Availability:** stable, open-DAT only.

Lists fixed-composition (stoichiometric) compound phases.

## Syntax

```excel
=XLL_CA_LIST_COMPOUNDS(datafile,[system],[update_token])
```

`system` optionally limits results to compounds representable in the supplied chemical basis.

## Returns

A one-column dynamic array of compound phase names.

Use [`XLL_CA_LIST_SOLUTIONS`](ca_list_solutions.md) for variable-composition phases.