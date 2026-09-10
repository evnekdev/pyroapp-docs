# XLL_CA_GET_COMPOUND_S298

**Availability:** stable, open-DAT only.

Returns the stored standard entropy at 298 K for selected stoichiometric compounds.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_S298(datafile,phases,[update_token])
```

## Returns

One numeric value per requested phase. `NaN` indicates that the requested value is not directly available from the compound's stored thermochemical representation.

Use [`XLL_CA_GET_COMPOUND_H298`](ca_get_compound_h298.md), [`XLL_CA_GET_COMPOUND_RANGE_COUNT`](ca_get_compound_range_count.md), and [`XLL_CA_GET_COMPOUND_CP`](ca_get_compound_cp.md) for the related standard-state fields.