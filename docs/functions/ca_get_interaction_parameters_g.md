# XLL_CA_GET_INTERACTIONS_PARAMETERS_G

**Availability:** stable, open-DAT only.

Reads the fixed thermodynamic coefficients of ordinary excess-Gibbs interaction records.

## Syntax

```excel
=XLL_CA_GET_INTERACTIONS_PARAMETERS_G(datafile,phases,interactions,value_indices,[update_token])
```

`phases` and `interactions` are paired. `value_indices` selects coefficients:

| Index | Term |
|---:|---|
| `0` | return all six terms |
| `1` | constant |
| `2` | linear in T |
| `3` | T·ln(T) |
| `4` | T² |
| `5` | T³ |
| `6` | 1/T |

## Returns

A matrix of requested interaction coefficient values.

Interaction descriptions come from the DAT parser rather than `TQLPAR`, so multi-digit interaction powers are preserved correctly.