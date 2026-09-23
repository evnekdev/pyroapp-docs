# Tutorial: temperature and composition sweeps

One PyroApp formula can evaluate a whole table of independent equilibria.

The legacy example 04 used this pattern extensively. New PyroApp workbooks should not manually split rows into thread-sized blocks.

## 1. Prepare a calculation grid

Assume:

- `B2` = datafile path;
- `B5:B54` = temperature;
- `C5:C54` = pressure;
- `D5:F54` = system-component amounts.

## 2. Build the input header

| | B | C | D | E | F |
| --- | --- | --- | --- | --- | --- |
| row 1 | `T, [C]` | `P` | `IA` | `IA` | `IA` |
| row 2 | `=""` | `=""` | `=""` | `=""` | `=""` |
| row 3 | `=""` | `=""` | component 1 | component 2 | component 3 |

Use component names from `XLL_CA_LIST_COMPONENTS`.

## 3. Choose outputs

A useful first output includes temperature, one or more phase amounts, `ERROR`, and `NSTABLE`.

For a phase amount `A`, put the exact phase name in header row 2.

## 4. Calculate the table

If the input header is `B1:F3`, inputs are `B5:F54`, and output header is `H1:K3`:

```excel
=XLL_CA_CALCULATE($B$2,B1:F3,B5:F54,H1:K3)
```

The result spills one row per input point.

## 5. Plot with Excel

Use a normal Excel XY/Scatter chart for:

- phase amount versus temperature;
- solved boundary temperature versus composition;
- solution composition versus bulk composition.

This replaces the legacy `plot_data` helper and keeps all numerical data visible in the workbook.

## Sanity checks

- Use only rows with acceptable `ERROR`.
- Investigate discontinuities rather than smoothing them automatically.
- Verify the intended phase selection.
- Use `NSTABLE` or individual activities when stability matters.

## Next

For a direct phase-appearance solve, continue to [Phase appearance and boundaries](phase-boundaries.md).
