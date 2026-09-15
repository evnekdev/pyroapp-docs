# UDF execution and derivative matrices

PyroApp can run transport-backed worksheet functions in **Blocking** or
**Async** mode. Choose the mode in the **PyroApp > Calculation** Ribbon group.

## Choose the UDF execution mode

**Blocking** is the default. Excel waits for each PyroApp call and receives its
final value directly. This mode gives a deterministic sequence when a workbook
uses parameter-setting functions and equilibrium calculations together.

**Async** runs transport work through Excel-DNA's asynchronous calculation
mechanism. It can keep ordinary workbooks more responsive when independent
formulas take time. Select it explicitly when the workbook does not depend on a
particular ordering of side-effecting SET formulas.

The preference applies to the current Excel process and is saved for the
Windows user. It is independent of Local IPC or future Remote gRPC transport.
Changing it does not edit or save any workbook.

## Configure a derivative-matrix sheet

The **Calculate derivative matrix** Ribbon button reads six cells on the active
worksheet. Put range addresses in `B1:B4`; `B5:B6` configure steps and masking.

| Cell | Enter |
| --- | --- |
| `B1` | Parameter range address, for example `D4:D9` |
| `B2` | Residual range address, for example `H4:H15` |
| `B3` | One numeric trigger-cell address, for example `C2` |
| `B4` | Upper-left output-cell address, for example `J4` |
| `B5` | Blank for step `0.1`, a numeric scalar such as `0.01`, or a range address containing one step per parameter |
| `B6` | Blank to vary every parameter, or a range address containing one mask value per parameter |

Mask values may be `TRUE`/`FALSE` or numeric, where zero is inactive and a
nonzero value is active. An inactive parameter gets a zero derivative column.
Steps must be finite and nonzero.

The parameter and residual ranges may be rectangular. PyroApp flattens each
range row by row. If there are `m` residual cells and `n` parameter cells, the
result occupies `m` rows and `n` columns beginning at the `B4` address:

```text
                 parameter 1   parameter 2   ... parameter n
residual 1          dr1/dp1       dr1/dp2            dr1/dpn
residual 2          dr2/dp1       dr2/dp2            dr2/dpn
...                    ...           ...                ...
residual m          drm/dp1       drm/dp2            drm/dpn
```

## Run the calculation

Choose **PyroApp > Calculation > Calculate derivative matrix**. PyroApp first
validates all addresses, range sizes, values, steps, mask entries, trigger,
output bounds, and unsafe overlaps between configuration, inputs, residuals,
and output. It then:

1. remembers the original parameters;
2. temporarily forces PyroApp UDFs to Blocking without changing Excel's calculation mode;
3. recalculates the unperturbed baseline;
4. perturbs each active parameter and writes its completed Jacobian column;
5. restores the original parameters and recalculates the original state;
6. restores your saved UDF execution preference.

Parameter cells are inert by workbook design. For the baseline, each perturbed
parameter, and final restoration, PyroApp writes the complete parameter vector,
increments the B3 trigger exactly once, waits for calculation to finish, and
then reads the B2 residuals. In Automatic calculation mode, changing B3 starts
the dependency calculation. In Manual mode, PyroApp preserves Manual and
calculates the active worksheet once after changing B3. It does not call
`Application.CalculateFull()` or recalculate other open workbooks.

A modeless progress window shows the completed parameter count and elapsed
time. **Cancel** stops between parameter columns. Cancellation and errors still
run the complete restoration sequence. Only one derivative calculation can run
in an Excel process at a time.

## Errors and workbook state

PyroApp stops if a required parameter or residual cell contains an Excel error,
a PyroApp error, a pending value, text, or a non-finite number. The error names
the cell where possible. A restoration failure is reported prominently because
the workbook can no longer be assumed to show its original state.

The operation does not save the workbook. Save when you are satisfied with the
matrix and the restored worksheet state.
