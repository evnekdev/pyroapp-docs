# XLL_CA_DONGLE_INFO

**Availability:** stable.

Returns information reported for the ChemApp licence dongle/runtime entitlement.

## Syntax

```excel
=XLL_CA_DONGLE_INFO([update_token])
```

## Returns

A horizontal two-cell array containing the reported dongle name/description and dongle identifier.

## Example

```excel
=XLL_CA_DONGLE_INFO()
```

The exact text depends on the installed/licensed ChemApp runtime.