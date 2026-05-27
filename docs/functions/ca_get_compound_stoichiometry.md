# CA_GET_COMPOUND_STOICHIOMETRY

## Description

Returns a stoichiometry matrix of stoichiometric phases (compounds). See [Compound Definition](../../common-definitions#stoichiometric-phase) for more details.

## Syntax

```excel
=CA_GET_COMPOUND_STOICHIOMETRY(datafile, compounds)
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile  | Absolute or relative filepath to a ChemSage datafile (both .dat and .cst). |
  | compounds | An array of compound names. |

## Returns

A stoichiometry matrix for the compounds in the input, NAN for compounds not present in the datafile.

## Underlying ChemApp routines

| **Routine** | **Description** |
|---|---|
| TQSTPC | GET-STOICHIOMETRY-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_CONSTITUENT_STOICHIOMETRY](../ca_get_constituent_stoichiometry)
  - [CA_GET_COMPOUND_WEIGHTS](../ca_get_compound_weights)