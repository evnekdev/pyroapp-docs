# XLL_CA_GET_CONSTITUENT_H298

**Availability:** stable, open-DAT only.

Returns standard enthalpies at 298.15 K for solution-phase constituents/endmembers, independent of whether each DAT record is stored as a Gibbs polynomial or H298/S298 + Cp.

## Syntax

```excel
=XLL_CA_GET_CONSTITUENT_H298(datafile,phases,constituents,[update_token])
```

`phases` and `constituents` are paired arrays and must have equal lengths.

## Returns

One value per `(phase,constituent)` pair. Gibbs-form records are evaluated analytically at 298.15 K so the result has the same logical meaning as the legacy ChemApp/PyroApp H getter.

Use [`XLL_CA_LIST_CONSTITUENTS`](ca_list_constituents.md) to obtain valid constituent names.
## Live Excel example

Constituent GET calls include both the exact solution-phase and constituent identity.

![Constituent property GET functions in Excel](../assets/excel/get/constituent-properties.png)
