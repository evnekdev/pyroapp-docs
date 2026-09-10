# XLL_CA_SET_INTERACTION_PARAMETERS_M

**Availability:** stable for magnetic interaction families exposed by the current DAT parser.

Changes magnetic interaction parameters in a local DAT file.

## Syntax

```excel
=XLL_CA_SET_INTERACTION_PARAMETERS_M(datafile,phases,interactions,values,[update_token])
```

`phases` and `interactions` identify corresponding targets. `values` supports two useful layouts:

- **one value per interaction** — changes the first expression's critical temperature (`Tcrit`);
- **complete flattened expression data** — for each interaction supply `Tcrit, beta` pairs for every magnetic expression in that record.

Use `XLL_CA_GET_INTERACTIONS_PARAMETERS_M` first to see the expression width for a record.

## Returns

A Boolean status array.

The edit is validated and written atomically to the original DAT path.