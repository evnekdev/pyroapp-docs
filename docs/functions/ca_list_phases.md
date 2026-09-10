# XLL_CA_LIST_PHASES

**Availability:** stable, open-DAT only.

Lists both solution phases and stoichiometric compounds in the DAT file.

## Syntax

```excel
=XLL_CA_LIST_PHASES(datafile,[system],[update_token])
```

| Argument | Meaning |
|---|---|
| `datafile` | Open `.DAT` path. |
| `system` | Optional chemical-system filter such as `Ca-Si-O` or `Na2O-Al2O3-SiO2`. |
| `update_token` | Optional recalculation dependency. |

The system filter keeps phases whose declared stoichiometry can be represented inside the supplied chemical basis. Leave it blank to list all phases.

## Returns

A one-column spill range of phase names.

See [Common definitions](../common-definitions.md).