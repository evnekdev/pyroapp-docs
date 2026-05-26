# CA_DIMENSIONS_MAX

## Description

Returns the internal array dimensions of ChemApp.

## Syntax

```excel
=CA_DIMENSIONS_MAX()
```

## Arguments

This function requires no arguments.

## Returns

11x2 array of values, meaning:

| Row# | Meaning |
|---|---|
| 1  | Maximum number of constituents. |
| 2  | Maximum number of system components. |
| 3  | Maximum number of mixture phases. |
| 4  | Maximum number of excess Gibbs energy coefficients for a mixture phase. |
| 5  | Maximum number of excess magnetic coefficients for a mixture phase. |
| 6  | Maximum number of sublattices for a mixture phase. |
| 7  | Maximum number of constituents of a sublattice. |
| 8  | Maximum number of oxide constituents of a phase described by the Gaye-Kapoor-Frohberg or Modified Quasichemical Formalisms. |
| 9  | Maximum number of Gibbs energy/heat capacity equations for a constituent. |
| 10 | Maximum number of Gibbs energy/heat capacity equations. |
| 11 | Maximum number of constituents with P,T-dependent molar volumes. |


## Underlying ChemApp routine

This function wraps the following ChemApp routine: [TQSIZE](https://gtt-technologies.de/ca-doc/index.html#tqsize).

## Related functions

  - [CA_DIMENSIONS](../ca_dimensions)