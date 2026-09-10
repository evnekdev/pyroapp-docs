# Quickstart

This quickstart verifies the add-in, inspects an open DAT file, and then shows the shape of a calculation table.

## 1. Verify PyroAppRS

Install the XLL that matches Excel bitness. In the interactive installer, choose the licensed ChemApp folder containing `chemapp_00.dll`; the installer records it for the isolated local worker. The package does not contain a ChemApp runtime.

Enter:

```excel
=XLL_PYROAPP_TRANSPORT()
```

A local installation normally reports `IPC` unless you have selected a remote server in the **PyroApp** Ribbon tab. If it does not, run the installed **PyroAppRS diagnostic** before calculating.

If ChemApp is available locally, you can also query:

```excel
=XLL_CA_VERSION()
```

## 2. List the contents of an open DAT file

Assume cell `B1` contains a path such as:

```text
C:\Thermo\my-system.dat
```

or a path relative to the workbook. Then try:

```excel
=XLL_CA_LIST_COMPONENTS($B$1)
```

and:

```excel
=XLL_CA_LIST_PHASES($B$1)
```

Both functions return dynamic arrays. They read the `.DAT` locally and do not start ChemApp.

## 3. Read a parameter

If `D2:D4` contains compound phase names:

```excel
=XLL_CA_GET_COMPOUND_H298($B$1,D2:D4)
```

GET functions support open `.DAT` files. They do not expose protected `.CST` parameter data.

## 4. Understand CA_CALCULATE

A calculation uses three blocks:

- `input_header`: three rows describing each condition column;
- `input`: one row per calculation point;
- `output_header`: three rows describing each requested output column.

In every `input_header` and `output_header`, rows 2 and 3 are the phase and constituent/component rows. When a field does not apply, use the Excel formula `=""` so the cell evaluates to the empty string. **Do not leave these header cells physically blank.** This keeps the full three-row header contiguous and easy to select, copy, resize, filter, and manipulate.

For example, with a two-component database, an input header might contain temperature, pressure, and two component input amounts. The matching input table can contain hundreds or thousands of rows. One `XLL_CA_CALCULATE` call evaluates the whole table and spills an output matrix.

```excel
=XLL_CA_CALCULATE($B$1,B5:E7,B8:E107,G5:J7)
```

The exact cell addresses are only illustrative. See [First equilibrium](tutorials/first-equilibrium.md) for a worked layout.

## 5. Force recalculation after an external file change

Excel does not automatically track the contents of a file referenced by a text path. Most PyroApp file functions therefore accept an optional `update_token`.

If a formula is:

```excel
=XLL_CA_LIST_PHASES($B$1,,Z1)
```

changing `Z1` causes PyroApp to execute again, even though the datafile path is unchanged. The token does not otherwise change the result.

## Next steps

- [Common definitions](common-definitions.md)
- [Working with DAT files](tutorials/datafiles.md)
- [CA_CALCULATE guide](functions/ca_calculate.md)
- [Input conditions](input_conditions.md)
- [Output properties](output_properties.md)
