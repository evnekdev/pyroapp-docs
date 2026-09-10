# XLL_CA_GET_COMPOUND_WEIGHTS

**Availability:** stable, open-DAT only.

Calculates molar masses of selected stoichiometric compound phases from their DAT stoichiometry and component molar masses.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_WEIGHTS(datafile,phases,[update_token])
```

## Returns

One numeric molar mass per requested compound. A missing compound returns `NaN`.

Use `XLL_CA_LIST_COMPOUNDS` to obtain valid names.