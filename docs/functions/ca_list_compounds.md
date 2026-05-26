# CA_LIST_COMPOUNDS

## Description

Returns the list of stoichiometric phases (compounds) in a datafile, optionally subject to chemical system constraints. [TODO] make a link to the compound definition.

## Syntax

```excel
=CA_LIST_COMPOUNDS(datafile,[system])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile   | Absolute or relative filepath to a ChemSage datafile (.dat/.cst) |
  | \[system\] | An optional argument indicating the chemical system of the returned instances. Example: 'Ca-Si-O', 'Na2O-Al2O3-SiO2' |

## Returns

An array of string values corresponding to compound names.

## Underlying ChemApp routines

The following ChemApp routines are involved :

| **Routine** | **Description** |
|---|---|
| [TQNOP](https://gtt-technologies.de/ca-doc/index.html#tqnop) | Get the total number of phases. |
| [TQGNP](https://gtt-technologies.de/ca-doc/index.html#tqgnsc) | Get name of a phase. |
| [TQMODL](https://gtt-technologies.de/ca-doc/index.html#tqgnsc) | Get the model name of a phase. |

## Related functions

  - [CA_LIST_COMPONENTS](../ca_list_components)
  - [CA_LIST_PHASES](../ca_list_phases)
  - [CA_LIST_SOLUTIONS](../ca_list_solutions)
  - [CA_LIST_SPECIES](../ca_list_species)
  - [CA_LIST_CONSTITUENTS](../ca_list_constituents)