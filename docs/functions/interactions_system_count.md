# XLL_INTERACTIONS_SYSTEM_COUNT

`XLL_INTERACTIONS_SYSTEM_COUNT(legacy_chemapp_dll, datafile, phase, systems)` counts ordinary excess-Gibbs interaction declarations whose participant element set exactly matches each requested system.

The first argument is retained only for legacy workbook compatibility and is ignored. `datafile` must be an open ASCII DAT file, `phase` is a mixture phase, and `systems` is a vertical or horizontal range of dash-separated systems such as `Cu-S` and `Cu-Fe-S`.

The function uses the local parser-backed DAT boundary. It does not start ChemApp or use the selected calculation transport.
