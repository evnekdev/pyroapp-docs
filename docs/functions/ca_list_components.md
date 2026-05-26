# CA_LIST_COMPONENTS

## Description

Returns the list of available system components in a datafile. [TODO] make a link to system component definition.

## Syntax

```excel
=CA_LIST_COMPONENTS(datafile)
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile | Absolute or relative filepath to a ChemSage datafile (.dat/.cst) |

## Returns

An array of string values corresponding to system component names.

## Underlying ChemApp routines

The following ChemApp routines are involved :

| **Routine** | **Description** |
|---|---|
| [TQNOSC](https://gtt-technologies.de/ca-doc/index.html#tqnosc) | Get the total number of system components. |
| [TQGNSC](https://gtt-technologies.de/ca-doc/index.html#tqgnsc) | Get name of a system component. |

## Related functions

  - [CA_LIST_PHASES](../ca_list_phases)
  - [CA_LIST_SOLUTIONS](../ca_list_solutions)
  - [CA_LIST_COMPOUNDS](../ca_list_compounds)
  - [CA_LIST_SPECIES](../ca_list_species)
  - [CA_LIST_CONSTITUENTS](../ca_list_constituents)