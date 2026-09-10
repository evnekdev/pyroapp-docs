# XLL_BEST_COMBINATION

**Status:** optimization interface retained; **current PyroApp 2 backend in development**.

Searches combinations of adjustable parameters and identifies the subset that performs best under the legacy linear-regression objective.

## Syntax

```excel
=XLL_BEST_COMBINATION(derivatives,residuals,weight,free,fixed_values,nparams)
```

`nparams` is the number of parameters to include in each candidate combination. Other arguments follow [`XLL_LINEAR_REGRESSION`](linear_regression.md).

## Returns

An integer vector identifying the selected parameter combination.

The search can be combinatorial; use it only on a deliberately limited candidate set.

!!! warning
    The PyroApp 2 backend is still incomplete. This page documents the migration interface, not a claim of production readiness.