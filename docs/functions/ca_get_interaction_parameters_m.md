# XLL_CA_GET_INTERACTIONS_PARAMETERS_M

**Availability:** stable for magnetic interaction families exposed by the current DAT parser.

Reads magnetic interaction parameters for selected interactions.

## Syntax

```excel
=XLL_CA_GET_INTERACTIONS_PARAMETERS_M(datafile,phases,interactions,[update_token])
```

`phases` and `interactions` are paired arrays.

## Returns

One row per interaction. For each magnetic expression, values are returned as alternating pairs:

```text
Tcrit_1, beta_1, Tcrit_2, beta_2, ...
```

The number of expressions is model/record dependent.

Use `XLL_CA_LIST_INTERACTIONS_M` to obtain the interaction identities accepted by this function.