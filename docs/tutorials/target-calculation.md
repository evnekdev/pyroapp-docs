# Tutorial: target calculations

A target calculation solves for a variable that makes a requested thermodynamic condition true. A common example is finding the temperature at which a phase appears.

## Formation target

Add an input column with `FORMATION` in header row 1. The input cell contains the phase name whose formation boundary you want to locate.

By default PyroApp solves for temperature. Use `VARIABLE` only when a different supported target variable is required.

## Precipitation target

`PRECIPITATION` similarly defines a phase-appearance target using PyroApp's precipitation convention.

## Direct property targets

The following input codes also activate target solving when used as target conditions:

`A`, `CP`, `H`, `S`, `G`, `V`, `AT`, `XP`, `XPT`.

## Choose the target variable

A `VARIABLE` column accepts:

```text
T
P
V
IA
IA0
```

Temperature is the default.

## Restrict the search

Use matching limit columns:

- `TLOW`, `THIGH`
- `PLOW`, `PHIGH`
- `VLOW`, `VHIGH`

Good physical bounds can make a target calculation more robust and avoid an irrelevant solution region.

## Output

Request the solved variable itself (for example `T`) plus the relevant phase amount/activity and an `ERROR` column. This makes the target result auditable rather than returning only a temperature with no indication of solver status.

!!! warning
    A target condition does not guarantee that a physically meaningful solution exists within the chosen search interval. Treat failed target rows as calculation failures, not as missing spreadsheet values to be silently interpolated.
