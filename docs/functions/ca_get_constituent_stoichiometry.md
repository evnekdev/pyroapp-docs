# CA_GET_CONSTITUENT_STOICHIOMETRY

## Description

Returns a stoichiometry matrix of phase constituents. [TODO] make a link to the phase constituent definition.

## Syntax

```excel
=CA_GET_CONSTITUENT_STOICHIOMETRY(datafile, phases, constituents)
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile  | Absolute or relative filepath to a ChemSage datafile (both .dat and .cst). |
  | phases | An array of phase names. |
  | constituents | An array of phase constituent names. |

## Returns

A stoichiometry matrix for the phase constituents in the input, NAN for constituents not present in the datafile.

## Underlying ChemApp routines

| **Routine** | **Description** |
|---|---|
| TQSTPC | GET-STOICHIOMETRY-OF-PHASE-CONSTITUENT |

## Related functions

  - [CA_GET_COMPOUND_STOICHIOMETRY](../ca_get_constituent_stoichiometry)
  - [CA_GET_CONSTITUENT_WEIGHTS](../ca_get_compound_weights)