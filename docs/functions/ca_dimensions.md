# CA_DIMENSIONS

# Description

## Syntax

```excel
=CA_DIMENSIONS(datafile)
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile | Absolute or relative filepath to a ChemSage datafile (.dat/.cst) |
  
## Returns

| Row# | Meaning |
|---|---|
| 1  | Current number of constituents. |
| 2  | Current number of system components. |
| 3  | Current number of mixture phases. |
| 4  | Current number of excess Gibbs energy coefficients for a mixture phase. |
| 5  | Current number of excess magnetic coefficients for a mixture phase. |
| 6  | Current number of sublattices for a mixture phase. |
| 7  | Current number of constituents of a sublattice. |
| 8  | Current number of oxide constituents of a phase described by the Gaye-Kapoor-Frohberg or Modified Quasichemical Formalisms. |
| 9  | Current number of Gibbs energy/heat capacity equations for a constituent. |
| 10 | Current number of Gibbs energy/heat capacity equations. |
| 11 | Current number of constituents with P,T-dependent molar volumes. |

## Underlying ChemApp routine

This function wraps the following ChemApp routine: [TQSIZE](https://gtt-technologies.de/ca-doc/index.html#tqused).

## Related functions

  - [CA_DIMENSIONS_MAX](../ca_dimensions_max)