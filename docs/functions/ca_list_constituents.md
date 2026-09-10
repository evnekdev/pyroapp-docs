# XLL_CA_LIST_CONSTITUENTS

**Availability:** stable, open-DAT only.

Lists phase constituents/endmembers for one or more solution phases.

## Syntax

```excel
=XLL_CA_LIST_CONSTITUENTS(datafile,phases,[system],[update_token])
```

`system` optionally filters constituents by chemical basis. Results for multiple phases are appended sequentially.

## Returns

A one-column dynamic array of constituent names.

Use these exact names in constituent-addressed GET functions or in `XLL_CA_CALCULATE` header row 3.