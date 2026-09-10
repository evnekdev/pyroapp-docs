# XLL_CA_EXPIRATION_DATE

**Availability:** stable.

Returns the licence expiration information reported by the selected ChemApp runtime.

## Syntax

```excel
=XLL_CA_EXPIRATION_DATE([update_token])
```

## Returns

A horizontal two-cell array: **month** and **year**.

## Example

```excel
=XLL_CA_EXPIRATION_DATE()
```

The meaning of a particular returned date is controlled by the ChemApp licence/provider, not by PyroApp.