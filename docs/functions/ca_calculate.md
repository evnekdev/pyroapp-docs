# XLL_CA_CALCULATE

`XLL_CA_CALCULATE` is PyroApp's main equilibrium function. One formula describes a complete table of ChemApp calculations and returns one output row for every input row.

## Syntax

```excel
=XLL_CA_CALCULATE(datafile,input_header,input,output_header,[entered],[update_token])
```

## Arguments

| Argument | Meaning |
|---|---|
| `datafile` | Absolute or workbook-relative ChemApp datafile path. DAT/CST/BIN calculation formats are supported according to the configured ChemApp runtime. |
| `input_header` | `3 × N` block describing the N input condition columns. |
| `input` | `R × N` block: R calculation points using the columns described by `input_header`. |
| `output_header` | `3 × M` block describing the M requested output columns. |
| `entered` | Optional phase-selection block. See **Phase selection** below. |
| `update_token` | Optional arbitrary dependency value used to force recalculation when an external file changes. |

## The three-row header

Both input and output headers use the same shape:

| Header row | Meaning |
|---|---|
| 1 | condition/property code, optionally followed by units, e.g. `T, [C]` |
| 2 | phase name when the property is phase-specific |
| 3 | phase constituent or system component when needed |

Blank phase/constituent cells are meaningful: they indicate a system-wide or component-level property depending on the code.

## Example layout

Suppose `B1` contains the datafile path. The input header is `B4:E6`, input points are `B7:E106`, and the output header is `G4:J6`:

```excel
=XLL_CA_CALCULATE($B$1,B4:E6,B7:E106,G4:J6)
```

The result spills as a `100 × 4` matrix.

See [First equilibrium](../tutorials/first-equilibrium.md) for a complete example and [Input conditions](../input_conditions.md) / [Output properties](../output_properties.md) for the code tables.

## Phase selection

The optional `entered` argument supplies a base phase selection.

- A one-row range containing phase names marks those phases entered.
- A two-or-more-row range can pair phase names with status prefixes `EN`, `D`, or `EL` for entered, dormant, or eliminated status.

Row-local `ENTERED`, `DORMANT` and `ELIMINATED` input columns are applied after the base selection, so they can vary the selection from point to point.

## Target calculations

A target condition asks ChemApp to solve for a variable rather than simply evaluate a fixed T/P state. Target-triggering inputs include `A`, `CP`, `H`, `S`, `G`, `V`, `AT`, `XP`, `XPT`, `FORMATION`, and `PRECIPITATION`.

The default target variable is temperature. `VARIABLE` can select `T`, `P`, `V`, `IA`, or `IA0` where appropriate. Search limits can be supplied using `TLOW`/`THIGH`, `PLOW`/`PHIGH`, or `VLOW`/`VHIGH`.

## Row independence

Current PyroApp rejects the legacy `USEFORNEXT` control. It would make a row depend on whichever row executed immediately before it, which is incompatible with reliable dynamic scheduling of independent points.

## Errors

Malformed headers or unknown names fail the formula. Some native ChemApp calculation errors are treated as point-level failures so other rows can continue. Add an `ERROR` output column to retrieve the current row's native error code; a successful row reports `0`.

`NSTABLE` counts phases whose activity is strictly greater than `0.9999`.

## Transport behavior

- **IPC:** the local worker opens the original client path.
- **gRPC:** PyroApp synchronizes the exact datafile version to the server cache, then the server schedules ChemApp work.

This is the only normal PyroApp datafile operation that uploads a file to the remote server.
