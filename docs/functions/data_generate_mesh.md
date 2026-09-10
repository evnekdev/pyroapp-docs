# XLL_DATA_GENERATE_MESH

**Status:** implemented data utility.

The legacy function generates a uniform composition mesh for a chosen number of active and total components.

## Syntax

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
