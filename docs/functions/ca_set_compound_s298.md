# CA_SET_COMPOUND_S298

## Description

Writes new S298 values of stoichiometric phases (compounds) in open-file .DAT datafiles (this function does not work with CST files). See [Compound Definition](../../common-definitions#stoichiometric-phase) for more details.

## Syntax

```excel
=CA_SET_COMPOUND_H298(datafile, compounds, values, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile  | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | compounds | An array with compound names. |
  | values    | An array of new H298 values. |
  | \[update_token\] | An optional parameter to forcefully trigger Excel execution. |

## Returns

A boolean array with `TRUE` values for each successful row write.

## Underlying ChemApp routines

The following ChemApp routines are involved :

| **Routine** | **Description** |
|---|---|
| TQCDAT | CHANGES-DATA-OF-THERMODYNAMIC-DATA-FILE |

## Related functions

  - [CA_GET_COMPOUND_S298](../ca_get_compound_s298)
  - [CA_SET_COMPOUND_H298](../ca_set_compound_h298)
  - [CA_SET_COMPOUND_CP](../ca_set_compound_cp8)
  