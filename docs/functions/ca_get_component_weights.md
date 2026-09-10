# XLL_CA_GET_COMPONENT_WEIGHTS

**Availability:** stable, open-DAT only.

Returns molar masses for selected system components.

## Syntax

```excel
=XLL_CA_GET_COMPONENT_WEIGHTS(datafile,components,[update_token])
```

## Returns

A one-column numeric array in the same order as `components`, in the molar-mass units stored by the DAT format (normally g/mol for ChemSage/ChemApp component declarations). A component name not found in the DAT is returned as `NaN`.

## Example

```excel
=XLL_CA_GET_COMPONENT_WEIGHTS($B$1,D2:D5)
```

Use [`XLL_CA_LIST_COMPONENTS`](ca_list_components.md) to obtain valid component names.