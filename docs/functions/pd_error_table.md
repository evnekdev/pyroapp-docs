# XLL_PD_ERROR_TABLE

**Status:** optimization/reporting interface retained; **current PyroApp 2 backend in development**.

Builds a compact residual-statistics table for categories of experimental/target points, comparing two residual vectors.

## Syntax

```excel
=XLL_PD_ERROR_TABLE(categories,residuals1,residuals2,mask,dTdx)
```

The legacy result summarizes quantities such as point count, mean/RMS error, minima and maxima by category and overall. `mask` selects included points; `dTdx` carries an optional derivative/scaling vector used by the phase-diagram error workflow.

## Returns

A table whose first column contains category labels and remaining columns contain statistics.

!!! warning
    The current PyroApp 2 backend remains incomplete. Treat the documented shape as a compatibility target until the implementation is marked stable.