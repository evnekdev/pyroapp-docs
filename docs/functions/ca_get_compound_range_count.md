# XLL_CA_GET_COMPOUND_RANGE_COUNT

**Availability:** stable, open-DAT only.

Returns the number of thermochemical temperature ranges/intervals stored for each selected stoichiometric compound.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_RANGE_COUNT(datafile,phases,[update_token])
```

## Returns

A one-column integer array, one count per phase.

Use the returned count to validate the one-based `range_indices` supplied to `XLL_CA_GET_COMPOUND_TUPPER`, `XLL_CA_GET_COMPOUND_CP`, or the corresponding SET function.