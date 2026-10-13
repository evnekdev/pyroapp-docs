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

A vector with one entry per derivative column. Free entries are the weighted least-squares solution; non-free entries retain the corresponding `fixed_values` input.

Blank cells, empty-string formulas, and `#N/A` mark unavailable observations. A row is omitted from the fit if any derivative in that row, its residual, or its weight is unavailable. Keep the matrix, residual vector, and weight vector at their original matching dimensions; do not remove cells from only one input. Numeric zeros remain valid observations. Other Excel errors and non-numeric text produce an error. An adjustable fit with no usable rows also produces an error.

In the practical derivative workflow, define `residual = target - current` and `A = d(current)/d(parameter)`. The solved vector is then interpreted as the proposed parameter change `Δp`, and fixed parameters normally use a fixed value of zero.

See [Solve and apply one linear parameter update](../tutorials/optimization/linear-update.md).
