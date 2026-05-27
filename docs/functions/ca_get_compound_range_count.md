# CA_GET_COMPOUND_RANGE_COUNT

## Description

Returns the number of Gibbs energy/CP ranges for the stoichiometric phases (compounds) in open-file .DAT datafiles (this function does not work with CST files) . See [Compound Definition](../../common-definitions#stoichiometric-phase) for more details.

## Syntax

```excel
=CA_GET_COMPOUND_RANGE_COUNT(datafile, compounds, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile  | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | compounds | A array with compound names. |
  | \[update_token\] | An optional parameter to forcefully trigger Excel execution. |

## Returns

An array of integer values for compounds present, NAN? if a compound is not present in the datafile.

## Underlying ChemApp routines

| **Routine** | **Description** |
|---|---|
| TQGDAT | GET-INPUT-THERMODYNAMIC-DATA-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_CONSTITUENT_RANGE_COUNT](../ca_get_constituent_range_count)
  - [CA_GET_COMPOUND_CP](../ca_get_compound_cp)
  