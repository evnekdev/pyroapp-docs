# XLL_LINEAR_REGRESSION

**Status:** implemented continuous-optimization helper.

The legacy function calculates parameter corrections from a derivative matrix using a weighted linear approximation. It is intended for iterative thermodynamic assessment workflows.

## Syntax

```excel
=XLL_LINEAR_REGRESSION(derivatives,residuals,weight,free,fixed_values)
```

- `derivatives`: N×K sensitivity/derivative matrix for N targets and K parameters.
- `residuals`: target-minus-calculated (or the workflow's defined residual) vector.
- `weight`: point weights.
- `free`: Boolean vector selecting adjustable parameters.
- `fixed_values`: static/frozen parameter contributions.

## Returns

A parameter-correction vector according to the legacy optimization convention.
