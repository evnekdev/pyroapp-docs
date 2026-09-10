# Tutorial: phase selection

Phase selection controls which phases ChemApp may use in a calculation.

## Base selection with `entered`

The fifth argument of `XLL_CA_CALCULATE` is optional. A simple one-row range of phase names defines an entered list.

Conceptually:

```excel
=XLL_CA_CALCULATE(datafile,input_header,input,output_header,entered_range)
```

If one or more phases are explicitly entered, PyroApp first treats the other phases as eliminated and then applies the selected states.

For a richer selection, use a multi-row block with phase names and status prefixes:

- `EN` — entered
- `D` — dormant
- `EL` — eliminated

## Change selection by calculation row

Add input columns whose row-1 codes are `ENTERED`, `DORMANT` or `ELIMINATED`. The input cell for each point contains a phase name. These row-local controls are applied **after** the base selection.

This is useful when one table explores several metastable restrictions without creating separate formulas.

## Isolation between rows

PyroApp restores the datafile/base phase state at the beginning of every accepted calculation row. A phase eliminated in row 1 is not accidentally left eliminated in row 2 merely because row 2 leaves the control cell blank.

## Debugging

Start with `XLL_CA_LIST_PHASES(datafile)` to verify spelling. If a row gives an unexpected equilibrium, add `ERROR`, phase amounts, and relevant activities to the output header before changing the selection logic.
