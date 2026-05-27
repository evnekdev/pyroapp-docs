# CA_LIST_CONSTITUENTS

## Description

Returns the list of available phase constituents for the given phases, optionally subject to chemical system constraints. [TODO] make a link to the phase constituent definition.

## Syntax

```excel
=CA_LIST_CONSTITUENTS(datafile, phases, [system])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile | Absolute or relative filepath to a ChemSage datafile (.dat/.cst) |
  | phases | An array of phase names, phase constituents are listed sequentially for all unique phase entries. |
  | \[system\] | An optional argument indicating the chemical system of the returned instances. Example: 'Ca-Si-O', 'Na2O-Al2O3-SiO2' |

## Returns

An array of string values corresponding to phase constituent names.

## Underlying ChemApp routines

[TODO]

## Related functions

  - [CA_LIST_COMPONENTS](../ca_list_components)
  - [CA_LIST_PHASES](../ca_list_phases)
  - [CA_LIST_SOLUTIONS](../ca_list_solutions)
  - [CA_LIST_COMPOUNDS](../ca_list_compounds)
  - [CA_LIST_SPECIES](../ca_list_species)