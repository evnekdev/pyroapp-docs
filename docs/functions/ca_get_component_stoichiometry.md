# XLL_CA_GET_COMPONENT_STOICHIOMETRY

**Availability:** stable, open-DAT only.

Returns selected system components expressed in the complete system-component basis of the DAT file.

## Syntax

```excel
=XLL_CA_GET_COMPONENT_STOICHIOMETRY(datafile,components,[update_token])
```

## Returns

A matrix with one row per requested component and one column per component in the DAT basis. For an existing system component this is the corresponding unit-basis row; a missing requested name produces a `NaN` row.

This function is useful when constructing generic composition-processing workbooks that need an explicit basis matrix.