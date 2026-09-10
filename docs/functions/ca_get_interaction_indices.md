# XLL_CA_GET_INTERACTION_INDICES

**Availability:** stable, open-DAT only.

Resolves ordinary interaction descriptions to their positional identities in the parsed phase model.

## Syntax

```excel
=XLL_CA_GET_INTERACTION_INDICES(datafile,phases,interactions,[update_token])
```

`phases` and `interactions` are paired arrays and must have equal lengths.

## Returns

One integer interaction position per requested pair.

!!! tip
    Generate the `interactions` input with `XLL_CA_LIST_INTERACTIONS_G`. Do not reconstruct interaction text manually, particularly when powers are greater than 9.