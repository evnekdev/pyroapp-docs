# CA_GET_CONSTITUENT_RANGE_COUNT

## Description

Returns the number of Gibbs energy/CP ranges for the phase constituents in open-file .DAT datafiles (this function does not work with CST files) . See [Phase Constituent Definition](../../common-definitions#phase-constituent) for more details.

## Syntax

```excel
=CA_GET_CONSTITUENT_RANGE_COUNT(datafile, phases, constituents, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile     | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | phases       | A array with phase names. |
  | constituents | A array with phase constituents names. |
  | \[update_token\] | An optional parameter to forcefully trigger Excel execution. |

## Returns

An array of integer values for phase constituent present, NAN? if a phase constituent is not present in the datafile.

## Underlying ChemApp routines

| **Routine** | **Description** |
|---|---|
| TQGDAT | GET-INPUT-THERMODYNAMIC-DATA-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_COMPOUND_RANGE_COUNT](../ca_get_compound_range_count)
  - [CA_GET_CONSTITUENT_CP](../ca_get_constituent_cp)