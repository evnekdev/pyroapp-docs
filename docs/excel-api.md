# Excel and the PyroApp API

PyroApp is an Excel-DNA XLL add-in. Its functions behave like native Excel functions but can return dynamic arrays and perform work asynchronously.

## Dynamic arrays

Many PyroApp functions return vectors or matrices. Enter the formula in the top-left cell only; current Excel versions automatically spill the result into adjacent cells.

Do not place values inside the intended spill area. Excel will otherwise return `#SPILL!`.

## Function naming

The current Excel interface uses names such as:

```text
XLL_CA_LIST_PHASES
XLL_CA_GET_COMPOUND_H298
XLL_CA_CALCULATE
XLL_DATA_CHANGE_BASIS
```

The `XLL_` prefix distinguishes the current compiled add-in from the legacy Python/xlwings implementation.

## Datafile paths

A datafile argument may be absolute or workbook-relative. Relative paths are resolved before background execution, so a project can keep its workbook and DAT file together in a portable folder.

## `update_token`

Excel knows when worksheet cells change, but it does not know when `database.dat` changes on disk. `update_token` is an optional dependency value included in the PyroApp formula identity. Change it to force a new evaluation after an external datafile update.

Typical patterns include a version number, date, or a dedicated control cell:

```excel
=XLL_CA_GET_COMPOUND_H298($B$1,D2:D10,$Z$1)
```

The token is not sent to ChemApp as a thermodynamic condition.

## Asynchronous execution

Long-running ChemApp operations do not need to block Excel's calculation thread. PyroApp converts Excel values and resolves workbook paths before background execution. The returned result is then delivered to Excel as a normal spill range.

Changing the calculation transport or gRPC address changes PyroApp's execution identity so formulas are not left attached to an obsolete destination.

## Self-contained formulas

Excel does not guarantee a user-chosen order between independent formulas. PyroApp therefore avoids APIs such as “set a condition in one cell, calculate in another.” A `CA_CALCULATE` formula contains the complete calculation definition it needs.
