# XLL_PD_ERROR_TABLE

**Status:** implemented optimization/reporting helper.

Builds a compact residual-statistics table for categories of experimental/target points, comparing two residual vectors.

## Syntax

```excel
=XLL_PD_ERROR_TABLE(categories,residuals1,residuals2,mask,dTdx)
```

The legacy result summarizes quantities such as point count, mean/RMS error, minima and maxima by category and overall. `mask` selects included points; `dTdx` carries an optional derivative/scaling vector used by the phase-diagram error workflow.

## Returns

A table whose first column contains category labels and remaining columns contain statistics.
