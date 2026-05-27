# CA_GET_CONSTITUENT_S298

## Description

Returns the S298 (standard entropy values) for phase constituents in open-file .DAT datafiles (this function does not work with CST files) . See [Phase Constituent Definition](../../common-definitions#phase-constituent) for more details.

## Syntax

```excel
=CA_GET_CONSTITUENT_S298(datafile, phases, constituents, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile     | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | phases       | A array with phase names. |
  | constituents | A array with phase constituent names. |
  | \[update_token\] | An optional parameter to forcefully trigger Excel execution. |

## Returns

An array of float values for phase constituents present, NAN if a constituent is not present in the datafile.

## Underlying ChemApp routines

| **Routine** | **Description** |
|---|---|
| TQGDAT | GET-INPUT-THERMODYNAMIC-DATA-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_CONSTITUENT_H298](../ca_get_constituent_h298)
  - [CA_GET_CONSTITUENT_Cp](../ca_get_constituent_cp)
  - [CA_GET_COMPOUND_S298](../ca_get_compound_s298)