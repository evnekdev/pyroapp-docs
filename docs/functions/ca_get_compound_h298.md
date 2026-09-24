# XLL_CA_GET_COMPOUND_H298

**Availability:** stable, open-DAT only.

Returns the standard enthalpy at 298.15 K for selected stoichiometric compound phases, independent of whether the DAT stores the reference state as a Gibbs polynomial or as H298/S298 + Cp.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_H298(datafile,phases,[update_token])
```

## Returns

One numeric value per requested phase. For a Gibbs-polynomial DAT record, PyroApp evaluates the exact stored polynomial and its temperature derivative at 298.15 K to recover the same logical H298 exposed by legacy ChemApp/PyroApp.

## Example

```excel
=XLL_CA_GET_COMPOUND_H298($B$1,D2:D8)
```

This function reads the DAT locally through `chemsage-parser`; it does not call ChemApp `TQGDAT` and does not support CST.
## Live Excel example

The compound-property sheet groups H298 with related standard-state, range, and coefficient reads while retaining the selected formula in the Formula Bar.

![Compound property GET functions in Excel](../assets/excel/get/compound-properties.png)
