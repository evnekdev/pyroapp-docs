# XLL_CA_GET_CONSTITUENT_TUPPER

**Availability:** stable, open-DAT only.

Returns the upper temperature associated with a selected thermochemical range for each phase constituent.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_TUPPER(datafile,phases,constituents,ranges,[update_token])
```

`phases`, `constituents`, and `ranges` describe corresponding targets; range indices are **one-based**.

## Returns

One upper-temperature value per target.