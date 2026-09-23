# XLL_BEST_COMBINATION

**Status:** implemented optimization helper.

Searches combinations of adjustable parameters and identifies the subset that performs best under the legacy linear-regression objective.

## Syntax

```excel
=XLL_BEST_COMBINATION(derivatives,residuals,weight,free,fixed_values,nparams)
```

`nparams` is the number of parameters to include in each candidate combination. Other arguments follow [`XLL_LINEAR_REGRESSION`](linear_regression.md).

## Returns

An integer 0/1 mask with one entry per derivative column. A value of 1 means that parameter is selected in the best tested combination; 0 means it is not selected.

See [Select a small parameter combination](../tutorials/optimization/parameter-selection.md).

The search can be combinatorial; use it only on a deliberately limited candidate set.
