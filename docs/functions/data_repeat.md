# XLL_DATA_REPEAT

**Status:** interface retained; **PyroApp 2 backend currently in development**.

The legacy utility repeats input rows/elements according to requested repeat counts. It is useful for expanding compact design tables into repeated calculation blocks.

## Intended syntax

```excel
=XLL_DATA_REPEAT(values,times)
```

`values` is a two-dimensional range. `times` supplies the repeat count(s).

## Returns

An expanded matrix containing repeated input entries/rows according to the legacy utility contract.

!!! warning
    The current Excel function is present, but the PyroApp 2 backend is not yet production-complete. This page documents the intended interface for migration; do not depend on it in a production workbook until the implementation-status matrix marks it complete.