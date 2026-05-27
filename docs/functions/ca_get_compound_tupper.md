# CA_GET_COMPOUND_TUPPER

## Description

Returns the upper temperature limits for G/CP ranges of stoichiometric compounds. See [Compound Definition](../../common-definitions#stoichiometric-phase) for more details.

## Syntax

```excel
=CA_GET_COMPOUND_TUPPER(datafile, compounds, range_indices, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile         | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | compounds        | A array with compound names. |
  | range_indices    | TODO |
  | \[update_token\] | An optional parameter to forcefully trigger Excel execution. |

## Returns

An array of float values for stoichiometric compounds present, NAN if a compound is not present in the datafile.

## Underlying ChemApp routines

| **Routine** | **Description** |
|---|---|
| TQGDAT | GET-INPUT-THERMODYNAMIC-DATA-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_COMPOUND_RANGE_COUNT](../ca_get_compound_range_count)
  - [CA_GET_COMPOUND_CP](../ca_get_compound_cp)
  - [CA_GET_CONSTITUENT_TUPPER](../ca_get_constituent_tupper)