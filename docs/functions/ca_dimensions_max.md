# XLL_CA_DIMENSIONS_MAX

**Availability:** stable runtime diagnostic.

Returns ChemApp capacity/dimension information for the selected runtime.

## Syntax

```excel
=XLL_CA_DIMENSIONS_MAX([update_token])
```

## Returns

A two-column spill range: dimension name and maximum value.

## Example

```excel
=XLL_CA_DIMENSIONS_MAX()
```

For the dimensions actually occupied by an open DAT file, use [`XLL_CA_DIMENSIONS`](ca_dimensions.md).