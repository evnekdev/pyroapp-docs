# XLL_CA_VERSION

**Availability:** stable.

Returns the ChemApp version reported by the selected runtime.

## Syntax

```excel
=XLL_CA_VERSION([update_token])
```

## Returns

A numeric ChemApp version value as reported by the native library.

## Example

```excel
=XLL_CA_VERSION()
```

Use this when checking that a workbook is running against the expected local worker or remote server runtime. The function does not inspect a DAT file.