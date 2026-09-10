# XLL_DATA_CHANGE_BASIS

**Availability:** stable utility in the current PyroApp interface.

Converts composition rows from one independent chemical-formula basis to another, optionally converting between mole and mass bases and optionally normalizing the result.

## Syntax

```excel
=XLL_DATA_CHANGE_BASIS(basis_initial,basis_final,data_initial,[isweight_initial],[isweight_final],[is_fraction])
```

| Argument | Meaning |
|---|---|
| `basis_initial` | Formula units describing columns of `data_initial`. |
| `basis_final` | Desired output formula basis. |
| `data_initial` | Rows of compositions/amounts. |
| `isweight_initial` | TRUE if the input values are a mass/weight basis; default FALSE. |
| `isweight_final` | TRUE for a mass/weight output basis; default FALSE. |
| `is_fraction` | TRUE to normalize each output row to sum to one; default FALSE. |

## Returns

A composition matrix in `basis_final` order.

Example bases can contain formula units such as `CaO`, `SiO2`, `FeO`, or elements, provided the transformation is chemically well-defined.
