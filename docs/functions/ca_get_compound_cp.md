# XLL_CA_GET_COMPOUND_CP

**Availability:** stable, open-DAT only.

Reads the logical ChemApp/PyroApp heat-capacity coefficient vector for selected compound ranges. Gibbs-polynomial and H298/S298 + Cp DAT records are handled through the same thermochemical function.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_CP(datafile,phases,range_indices,value_indices,[update_token])
```

- `range_indices` are one-based.
- `value_indices = 1..10` uses the native legacy ChemApp `TQGDAT("Cp")` term number.\n- `value_indices = 0` returns the historical PyroApp ten-value grouped display vector. For compatibility, that all-values display groups the optional coefficient values before their powers; it is not simply the native 1..10 sequence.

## Returns

A numeric matrix. The safest rectangular usage is to request the same coefficient mode for every target (all `0`, or one indexed coefficient per target).

Missing optional Cp terms are returned as zero. For Gibbs-form records the Cp coefficients are derived exactly from `Cp = -T d²G/dT²`; they are not raw Gibbs coefficients.