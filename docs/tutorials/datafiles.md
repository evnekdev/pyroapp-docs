# Working with DAT files

Open `.DAT` files are the inspectable/editable database format in PyroApp.

## Discover the datafile

Start with:

```excel
=XLL_CA_LIST_COMPONENTS(datafile)
=XLL_CA_LIST_PHASES(datafile)
=XLL_CA_LIST_SOLUTIONS(datafile)
=XLL_CA_LIST_COMPOUNDS(datafile)
```

For a solution phase, inspect:

```excel
=XLL_CA_LIST_CONSTITUENTS(datafile,phases)
=XLL_CA_LIST_SPECIES(datafile,phases)
=XLL_CA_LIST_INTERACTIONS_G(datafile,phases)
=XLL_CA_LIST_INTERACTIONS_M(datafile,phases)
```

These operations parse the DAT locally.

## Read parameters

Use GET functions to retrieve stored H298/S298/Cp data, stoichiometry, molar masses and interaction parameters. Range and coefficient indices are **1-based** in the Excel interface.

When a requested numeric datum is structurally unavailable, some GET operations return `NaN`; an invalid entity/domain can instead produce a clear DAT error. Do not treat `NaN` as zero.

## Edit parameters

SET functions modify the selected DAT file itself. Keep a backup before experimentation.

Example pattern:

```excel
=XLL_CA_SET_COMPOUND_H298(datafile,phase_names,new_values,update_token)
```

Successful writes are planned semantically, validated, written to a temporary file and atomically replace the original path.

## Interaction identity

Use `XLL_CA_LIST_INTERACTIONS_G/M` to obtain the interaction descriptions expected by the interaction GET/SET functions. Do not type or reconstruct interaction identifiers manually if you can reference the spilled list. PyroApp preserves multi-digit interaction powers from the DAT model and does not depend on `TQLPAR` display formatting.

## Recalculation after edits

A SET formula changes the file, but Excel does not inherently know that another formula's text-path dependency has changed. Use a shared `update_token` cell to coordinate recalculation when building an editing workbook.
