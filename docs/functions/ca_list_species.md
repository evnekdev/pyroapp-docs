# XLL_CA_LIST_SPECIES

**Availability:** stable, open-DAT only.

Lists the sublattice species declared for one or more solution phases.

## Syntax

```excel
=XLL_CA_LIST_SPECIES(datafile,phases,[update_token])
```

## Returns

A two-column spill range:

1. species name;
2. one-based sublattice number.

Species from the requested phases are appended in request/datafile order.

## Example

```excel
=XLL_CA_LIST_SPECIES($B$1,D2:D3)
```

A species is not always the same thing as a phase constituent. See [Common definitions](../common-definitions.md).