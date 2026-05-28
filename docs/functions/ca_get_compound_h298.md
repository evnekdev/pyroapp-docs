# CA_GET_COMPOUND_H298

## Description

Returns the H298 (standard enthalpy values) for stoichiometric phases (compounds) in open-file .DAT datafiles (this function does not work with CST files) . See [Compound Definition](../../common-definitions#stoichiometric-phase) for more details.

## Syntax

```excel
=CA_GET_COMPOUND_H298(datafile, compounds, [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile  | Absolute or relative filepath to a ChemSage datafile in open format (.dat) |
  | compounds | An array with compound names. |
  | \[update_token\] | An optional parameter to forcefully trigger Excel execution. |

### Note about Excel execution model

[TODO]

## Returns

An array of float values for compounds present, NAN if a compound is not present in the datafile.

## Underlying ChemApp routines

The following ChemApp routines are involved :

| **Routine** | **Description** |
|---|---|
| TQGDAT | GET-INPUT-THERMODYNAMIC-DATA-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_COMPOUND_S298](../ca_get_compound_s298)
  - [CA_GET_COMPOUND_CP](../ca_get_compound_cp)
  - [CA_GET_CONSTITUENT_H298](../ca_get_constituent_h298)
