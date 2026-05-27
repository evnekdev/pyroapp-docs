# CA_GET_CONSTITUENT_TUPPER

## Description

Returns the upper temperature limits for G/CP ranges of phase constituents. See [Phase Constituent Definition](../../common-definitions#phase-constituent) for more details.

## Syntax

```excel
=CA_GET_CONSTITUENT_TUPPER(datafile, phases, constituents, range_indices, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile            | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | phases              | An array with phase names. |
  | constituents        | An array with phase constituent names. |
  | range_indices       | TODO |
  | \[update_token\]    | An optional parameter to forcefully trigger Excel execution. |

## Returns

An array of float values for phase constituents present, NAN if a phase constituent is not present in the datafile.

## Underlying ChemApp routines

| **Routine** | **Description** |
|---|---|
| TQGDAT | GET-INPUT-THERMODYNAMIC-DATA-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_CONSTITUENT_RANGE_COUNT](../ca_get_constituent_range_count)
  - [CA_GET_CONSTITUENT_CP](../ca_get_constituent_cp)
  - [CA_GET_COMPOUND_TUPPER](../ca_get_compound_tupper)