# XLL_CA_GET_COMPOUND_H298

**Availability:** stable, open-DAT only.

Returns the stored standard enthalpy at 298 K for selected stoichiometric compound phases.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_H298(datafile,phases,[update_token])
```

## Returns

One numeric value per requested phase. If the compound exists but its thermochemical representation does not directly contain an H298 value, PyroApp returns `NaN` rather than inventing one from a different representation.

## Example

```excel
=XLL_CA_GET_COMPOUND_H298($B$1,D2:D8)
```

This function reads the DAT locally through `chemsage-parser`; it does not call ChemApp `TQGDAT` and does not support CST.