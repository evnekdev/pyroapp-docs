# XLL_CA_GET_COMPOUND_TUPPER

**Availability:** stable, open-DAT only.

Returns the upper temperature associated with a selected thermochemical range for each compound.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_TUPPER(datafile,phases,ranges,[update_token])
```

`ranges` contains **one-based** range indices corresponding to the requested phases.

## Returns

One upper-temperature value per phase/range pair.

Use `XLL_CA_GET_COMPOUND_RANGE_COUNT` first when the valid range count is not known.