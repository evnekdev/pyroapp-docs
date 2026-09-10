# XLL_CA_SET_COMPOUND_H298

**Availability:** stable, open-DAT only.

Changes the stored H298 value for selected stoichiometric compounds.

## Syntax

```excel
=XLL_CA_SET_COMPOUND_H298(datafile,phases,values,[update_token])
```

`phases` and `values` must describe corresponding targets.

## Returns

A Boolean status array, one value per requested edit.

!!! warning "This edits the DAT file"
    The canonical file at `datafile` is replaced atomically after parsing, semantic validation and serialization succeed. Keep a backup or use version control before changing thermodynamic parameters.

The function is local even when gRPC calculation transport is selected.