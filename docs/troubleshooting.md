# Troubleshooting

## The functions do not appear in Excel

Confirm that you loaded the packed XLL matching Excel bitness. If you replaced the package while Excel was running, close all Excel processes and reopen the workbook.

## `#SPILL!`

A PyroApp array needs empty cells below/right of the formula. Clear the obstructing values or move the formula.

## DAT function reports “unsupported datafile format”

LIST/GET/SET parameter functions in PyroApp use the local open-DAT parser. They require `.DAT`. Protected `.CST` parameter inspection/editing is intentionally unsupported. Use CST only for ChemApp calculation where your licence permits it.

## DAT parsing failed

The local parser uses strict DAT parsing. Verify that the file is complete and is genuinely a ChemSage/ChemApp DAT file. If you hand-edited it, compare it with the last known working revision.

## Entity not found

Use the LIST functions rather than guessing names. Phase, constituent and interaction identities must match the datafile.

## A SET function changed the database

That is expected: current SET functions modify the canonical DAT file at the path. Restore the file from version control/backup if the change was not intended.

## Local CA_CALCULATE cannot load ChemApp

Run **PyroApp diagnostic** from the Start menu first. It reports whether the installed package expects a **bundled** or **external** runtime and validates the architecture.

- **Bundled runtime expected:** `pyroapp.runtime.json` must identify `bundled`, and `chemapp_00.dll` must exist under the installed PyroApp `ChemApp` directory. Do not set `PYROAPP_CHEMAPP_HOME` to try to redirect a bundled package.
- **External runtime expected:** configure `PYROAPP_CHEMAPP_HOME` or `pyroapp.runtime.json` with the existing licensed runtime folder containing `chemapp_00.dll`.

In both modes, the worker and ChemApp DLLs must match the Excel bitness. PyroApp loads ChemApp in an isolated worker rather than Excel, so do not register ChemApp DLLs in Excel.

## The installer says Excel bitness does not match

Open **File → Account → About Excel** and use the installer with the same bitness. Windows bitness is not the deciding factor; Excel's bitness is.

## The external installer cannot find ChemApp

This applies only to an `ExternalChemApp` installer. Browse to the existing licensed runtime directory containing `chemapp_00.dll`. Contact the ChemApp supplier if you do not have a compatible runtime and licence. A bundled installer does not show this page; it still requires a valid ChemApp licence to calculate.

## The installer says that .NET Desktop Runtime is required

Install Microsoft .NET Desktop Runtime 8.x matching the PyroApp/Excel
architecture, then rerun the installer. A developer SDK, Visual Studio, Cargo,
or a source checkout is not required.

## A worker remains after Excel closed

Workers are owned by the XLL and also monitor the Excel process. If a process persists, record the PyroApp version, diagnostic output, and process ID before ending it, then report it as a defect. Do not delete the installed folder while Excel is running.

## A remote calculation cannot connect

Check:

```excel
=XLL_PYROAPP_TRANSPORT()
=XLL_PYROAPP_GRPC_ADDRESS()
```

Verify the server name/port with the operator. The server must be configured to listen on an address reachable from your machine.

To change the endpoint, use **PyroApp → Connection** in the Ribbon, then **Test Connection** and **Apply**. The worksheet compatibility formulas do not change the process-wide connection.

## Some calculation rows are NaN

Add an `ERROR` column to the output header. Point-level ChemApp failures can allow the rest of the table to continue. Check target limits, phase selection, units and whether the calculation is thermodynamically well constrained.

## Results look off by a unit factor

Each header column has its own units. Explicitly write the unit in row 1 (for example `T, [C]`) and check the [System units](system_units.md) table. PyroApp does not inherit a custom unit from the previous column.

## Excel does not recalculate after I changed a DAT file externally

Change the formula's `update_token`. Excel tracks cell dependencies, not arbitrary file contents.
