# XLL_DATA_GENERATE_MESH

**Status:** interface retained; **PyroApp 2 backend currently in development**.

The legacy function generates a uniform composition mesh for a chosen number of active and total components.

## Intended syntax

```excel
=XLL_DATA_GENERATE_MESH(nintervals,nactive,ntotal)
```

| Argument | Meaning |
|---|---|
| `nintervals` | Number of composition intervals used to discretize the active simplex. |
| `nactive` | Number of composition components that vary. |
| `ntotal` | Total number of output composition components, including non-varying/padded components. |

## Returns

A matrix of composition-grid points.

!!! warning
    The Excel surface exists, but the current PyroApp 2 backend remains incomplete. Use an explicit worksheet/grid generator for production work until this function is marked stable.