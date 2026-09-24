# XLL_CA_GET_COMPOUND_S298

**Availability:** stable, open-DAT only.

Returns the standard entropy at 298.15 K for selected stoichiometric compounds, independent of the DAT thermochemical storage representation.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_S298(datafile,phases,[update_token])
```

## Returns

One numeric value per requested phase. For a Gibbs-polynomial record, PyroApp obtains S298 analytically from `-dG/dT` at 298.15 K, matching the logical legacy ChemApp/PyroApp operation.

Use [`XLL_CA_GET_COMPOUND_H298`](ca_get_compound_h298.md), [`XLL_CA_GET_COMPOUND_RANGE_COUNT`](ca_get_compound_range_count.md), and [`XLL_CA_GET_COMPOUND_CP`](ca_get_compound_cp.md) for the related standard-state fields.