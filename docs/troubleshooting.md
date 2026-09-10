# Troubleshooting

## The functions do not appear in Excel

Confirm that you loaded the packed XLL matching Excel bitness. If you replaced the package while Excel was running, close all Excel processes and reopen the workbook.

## `#SPILL!`

A PyroApp array needs empty cells below/right of the formula. Clear the obstructing values or move the formula.

## DAT function reports “unsupported datafile format”

LIST/GET/SET parameter functions in PyroApp 2 use the local open-DAT parser. They require `.DAT`. Protected `.CST` parameter inspection/editing is intentionally unsupported. Use CST only for ChemApp calculation where your licence permits it.

## DAT parsing failed

The local parser uses strict DAT parsing. Verify that the file is complete and is genuinely a ChemSage/ChemApp DAT file. If you hand-edited it, compare it with the last known working revision.

## Entity not found

Use the LIST functions rather than guessing names. Phase, constituent and interaction identities must match the datafile.

## A SET function changed the database

That is expected: current SET functions modify the canonical DAT file at the path. Restore the file from version control/backup if the change was not intended.

## Local CA_CALCULATE cannot load ChemApp

Common causes include an unavailable licensed library, incorrect worker/DLL configuration, or a 32/64-bit native mismatch. PyroApp loads ChemApp in the worker process rather than Excel, so inspect the worker/runtime package rather than registering the DLL in Excel.

## A remote calculation cannot connect

Check:

```excel
=XLL_PYROAPP_TRANSPORT()
=XLL_PYROAPP_GRPC_ADDRESS()
```

Verify the server name/port with the operator. The server must be configured to listen on an address reachable from your machine.

## Some calculation rows are NaN

Add an `ERROR` column to the output header. Point-level ChemApp failures can allow the rest of the table to continue. Check target limits, phase selection, units and whether the calculation is thermodynamically well constrained.

## Results look off by a unit factor

Each header column has its own units. Explicitly write the unit in row 1 (for example `T, [C]`) and check the [System units](system_units.md) table. PyroApp does not inherit a custom unit from the previous column.

## Excel does not recalculate after I changed a DAT file externally

Change the formula's `update_token`. Excel tracks cell dependencies, not arbitrary file contents.
