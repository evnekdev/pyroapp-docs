# Migrate a PyroApp 1.x workbook

Existing PyroApp 1.x workbooks are commonly macro-enabled `.xlsm` files built around xlwings/Python formulas and, in some cases, workbook VBA. Current PyroApp uses compiled `XLL_*` worksheet functions and does not require the old Python/xlwings bridge.

Use **Migrate legacy workbook** to create a separate current-format `.xlsx` workbook from an existing PyroApp 1.x file.

!!! important "The original workbook is preserved"
    Migration never overwrites the source `.xlsm`. The migrator works from an isolated temporary copy and creates a separate `.xlsx` output.

!!! warning "VBA is intentionally removed"
    The migrated file is macro-free. Excel `.xlsx` files do not contain a VBA project, so VBA stored in the original workbook is not copied into the output. If your workbook contains custom VBA that performs work beyond legacy PyroApp integration, keep the original `.xlsm` and review that VBA separately.

## Before you migrate

1. Install the current PyroApp version.
2. Save the legacy workbook.
3. Close the legacy workbook in Excel before starting migration.
4. Keep the original `.xlsm` as your reference copy.

Migration reads the workbook's last saved state. It does not attach to or modify your currently open Excel session, and legacy workbook macros are disabled while the private migration copy is opened.

## Start the migrator

The installed migrator can be started in either of these ways:

- in Excel, open the **PyroApp** Ribbon and choose **Tools / Help → Migrate legacy workbook**;
- from the Windows Start menu, choose **Migrate legacy workbook**.

The same installed architecture-matched migration program is used in both cases.

## Convert the workbook

1. In **Select a legacy PyroApp workbook**, choose the saved `.xlsm` file.
2. Choose where to save the new workbook.
3. The default output name is based on the source name and ends in `-PyroApp.xlsx`.
4. Wait for the migration and verification to finish.
5. When PyroApp reports **workbook migration complete**, open the new `.xlsx` file in normal desktop Excel with the current PyroApp add-in loaded.

A text migration report is written beside the output workbook. By default its name is:

```text
<output workbook>.migration-report.txt
```

The report records the formula translations and `CA_CALCULATE` header normalizations that were made.

## What the migrator changes

### Legacy PyroApp formulas

Recognized PyroApp 1.x worksheet functions are rewritten to their current explicit `XLL_*` equivalents.

For example:

```text
CA_LIST_PHASES(...)          -> XLL_CA_LIST_PHASES(...)
CA_GET_COMPOUND_H298(...)    -> XLL_CA_GET_COMPOUND_H298(...)
CA_CALCULATE(...)            -> XLL_CA_CALCULATE(...)
DATA_CHANGE_BASIS(...)       -> XLL_DATA_CHANGE_BASIS(...)
LINEAR_REGRESSION(...)       -> XLL_LINEAR_REGRESSION(...)
```

Supported formulas are translated deliberately rather than by simply adding `XLL_` to every unknown function name. If the migrator finds a legacy PyroApp function for which there is no approved translation, it stops and reports the exact worksheet/cell instead of silently producing a partly converted workbook.

Dynamic-array-capable PyroApp formulas are written using Excel's current formula model so the migrated workbook does not acquire an unintended implicit-intersection `@` before an `XLL_*` call.

### `CA_CALCULATE` headers

Current PyroApp keeps the same three-row input/output header concept used by legacy `CA_CALCULATE`, but unused cells in the second and third header rows use literal text:

```text
""
```

The migrator converts physically blank header cells and legacy empty-string formulas to that literal marker.

Do **not** change the marker to:

```text
=""
```

The current authored convention is the two quote characters as cell text, with no leading equals sign.

### Existing Excel workbook content

Excel itself is used to open and save the workbook. This preserves normal workbook content through Excel's own serializer, including worksheet structure and common Excel objects such as formulas, formatting, charts, tables, comments/notes, shapes, pivots and defined names, subject to Excel's normal `.xlsm` → `.xlsx` Save As behavior.

Legacy multi-cell CSE array formulas are treated separately from current dynamic-array formulas so their array semantics are not casually converted.

## What is deliberately not carried forward

The output is designed for current PyroApp, so:

- the VBA project is removed;
- macros are not executed during migration;
- obsolete communication-setting formulas are not translated into new worksheet controls;
- an unsupported or unsafe legacy PyroApp formula causes migration to fail rather than be guessed;
- complex `CA_CALCULATE` header references that cannot be resolved safely are rejected instead of being rewritten heuristically.

Examples of supported header references include ordinary A1 ranges, sheet-qualified A1 ranges and ordinary defined names. More complex generated references can require manual cleanup before a workbook can be migrated.

## After migration

Open the new `.xlsx` workbook with the current PyroApp installed and check the important calculation sheets before using it for research work.

A useful first check is:

1. confirm that the migrated PyroApp formulas begin with `XLL_`;
2. confirm that dynamic-array results spill normally;
3. recalculate representative `XLL_CA_CALCULATE` tables;
4. compare important results with the original saved workbook;
5. read the migration report for every formula/header change.

Keep the original `.xlsm` until you are satisfied with the migrated workbook.

## If migration stops with an error

Migration is fail-closed. A failed conversion does not leave a partially accepted output workbook.

The error/report identifies the problem as specifically as possible. Typical reasons include:

- an unrecognized legacy PyroApp function;
- a `CA_CALCULATE` header reference that is too complex to migrate safely;
- the source workbook still being open;
- an invalid source/output path;
- Excel being unable to reopen and verify the generated `.xlsx`.

Correct the reported issue in a copy of the legacy workbook, save and close it, then run migration again.

## Advanced command-line use

The installed migrator also supports an explicit command-line form:

```text
PyroApp-Workbook-Migrator.exe \
  --input legacy.xlsm \
  --output migrated.xlsx \
  [--report migrated.xlsx.migration-report.txt]
```

Most users should use the PyroApp Ribbon or Start menu command instead.
