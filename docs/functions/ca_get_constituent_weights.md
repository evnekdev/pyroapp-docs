# CA_GET_CONSTITUENT_WEIGHTS

## Description

Returns molar masses of phase constituents. [TODO] make a link to the phase constituent definition.

## Syntax

```excel
=CA_GET_CONSTITUENT_WEIGHTS(datafile, phases, constituents)
```

## Arguments

  |  **Argument** | **Description** |
  |---|---|
  | datafile  | Absolute or relative filepath to a ChemSage datafile (both .dat and .cst). |
  | phases | An array of phase names. |
  | constituents | An array of phase constituent names. |

## Returns

An array of float values of WMASS \[g/mol\], NAN for constituents not present in the datafile.

## Underlying ChemApp routines

The following routines are involved :

| **Routine** | **Description** |
|---|---|
| TQSTPC | GET-STOICHIOMETRY-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_COMPOUND_WEIGHTS](../ca_get_constituent_weights)
  - [CA_GET_CONSTITUENT_STOICHIOMETRY](../ca_get_compound_stoichiometry)