# Tutorial: first equilibrium table

This example shows the **shape** of a PyroApp calculation. Use component and phase names from your own datafile.

Assume `B1` contains the datafile path.

## 1. Discover component names

```excel
=XLL_CA_LIST_COMPONENTS($B$1)
```

Use the returned component names exactly in the calculation header.

## 2. Build the input header

Create a 3-row header with columns for temperature, pressure and incoming component amounts. For a hypothetical two-component system `A-B`:

| | B | C | D | E |
|---|---|---|---|---|
| row 1 | `T, [C]` | `P` | `IA` | `IA` |
| row 2 |  |  |  |  |
| row 3 |  |  | `A` | `B` |

The third row identifies the system component for the amount columns.

## 3. Enter calculation points

Below the header, enter one row per equilibrium point, for example temperatures and compositions. Use pressure in the default unit (`bar`) unless the header requests another unit.

## 4. Build an output header

For example:

| | G | H | I |
|---|---|---|---|
| row 1 | `T, [C]` | `A` | `A` |
| row 2 |  | `LIQUID` | `SOLID` |
| row 3 |  |  |  |

Replace `LIQUID` and `SOLID` with real phase names from `XLL_CA_LIST_PHASES`.

## 5. Calculate

If the input header is `B4:E6`, data are `B7:E26`, and output header is `G4:I6`:

```excel
=XLL_CA_CALCULATE($B$1,B4:E6,B7:E26,G4:I6)
```

The result spills to 20 rows and 3 columns.

!!! tip
    Prefer one table call with many rows over hundreds of independent one-row formulas. It reduces setup overhead and gives the runtime more opportunity to schedule work efficiently.
