# XLL_CA_SET_COMPOUND_S298

**Availability:** stable, open-DAT only.

Changes stored S298 values for selected stoichiometric compounds.

## Syntax

```excel
=XLL_CA_SET_COMPOUND_S298(datafile,phases,values,[update_token])
```

## Returns

A Boolean status array corresponding to the requested phases.

The DAT file is edited at the supplied path using a validated transactional update. If the requested representation cannot store the parameter safely, the edit fails rather than inventing a new thermodynamic representation.