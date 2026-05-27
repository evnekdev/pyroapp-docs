# CA_GET_COMPOUND_WEIGHTS

## Description

Returns molar masses of stoichiometric phases (compounds). See [Compound Definition](../../common-definitions#stoichiometric-phase) for more details.

## Syntax

```excel
=CA_GET_COMPOUND_WEIGHTS(datafile, compounds)
```

## Arguments

  |  **Argument** | **Description** |
  |---|---|
  | datafile  | Absolute or relative filepath to a ChemSage datafile (both .dat and .cst). |
  | compounds | An array of compound names. |
  

## Returns

An array of float values of WMASS \[g/mol\], NAN for compound names not present in the datafile.

## Underlying ChemApp routines

The following routines are involved :

| **Routine** | **Description** |
|---|---|
| TQSTPC | GET-STOICHIOMETRY-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_CONSTITUENT_WEIGHTS](../ca_get_constituent_weights)
  - [CA_GET_COMPOUND_STOICHIOMETRY](../ca_get_compound_stoichiometry)