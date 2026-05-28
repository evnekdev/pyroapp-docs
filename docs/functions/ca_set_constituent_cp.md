# CA_SET_CONSTITUENT_CP

## Description

Writes new heat capacity values of stoichiometric phases (compounds) to open-file .DAT datafiles (this function does not work with CST files). See [Phase Constituent Definition](../../common-definitions#phase-constituent) for more details.

## Syntax

```excel
=CA_SET_CONSTITUENT_CP(datafile, phases, constituents, range_indices, value_indices, values, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile         | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | phases           | An array of phase names. |
  | constituents     | An array of phase constituent names. |
  | range_indices    | TODO |
  | value_indices    | TODO |
  | values           | An array of new H298 values. |
  | \[update_token\] | An optional parameter to forcefully trigger Excel execution. |

## Returns

A boolean array with `TRUE` values for each successful row write.

## Underlying ChemApp routines

The following ChemApp routines are involved :

| **Routine** | **Description** |
|---|---|
| TQCDAT | CHANGES-DATA-OF-THERMODYNAMIC-DATA-FILE |

## Related functions

  - [CA_GET_CONSTITUENT_CP](../ca_get_constituent_cp)
  - [CA_SET_CONSTITUENT_H298](../ca_set_constituent_h298)
  - [CA_SET_CONSTITUENT_S298](../ca_set_constituent_s298)
