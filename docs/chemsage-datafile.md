# ChemSage / ChemApp datafiles

PyroApp works with thermodynamic systems stored in ChemSage/ChemApp datafiles. Two file classes matter to users.

## Open DAT files

`.DAT` files are human-readable thermodynamic declarations. PyroApp 2 can parse them locally and therefore supports:

- listing components, phases, constituents, species and interactions;
- reading standard-state and interaction parameters;
- reading stoichiometry and molar masses;
- changing supported parameters with `XLL_CA_SET_*` functions;
- using the file for `XLL_CA_CALCULATE`.

The local parser validates the DAT structure rather than treating it as arbitrary text.

## Protected CST files

`.CST` files contain protected/transparent ChemApp data. Their parameter records are not available to PyroApp's local parser.

Consequently:

- `XLL_CA_GET_*` and `XLL_CA_SET_*` are **DAT-only**;
- structural DAT LIST functions are also local-DAT functions in the current PyroApp 2 client;
- `XLL_CA_CALCULATE` may use CST when the configured ChemApp runtime and licence permit it.

## BIN files

The calculation transport can identify DAT, CST and BIN formats for ChemApp execution. BIN is not an open-DAT inspection/editing format.

## Relative paths

You can normally keep the datafile beside the workbook and pass a relative path. PyroApp resolves it against the workbook location before asynchronous execution.

## Editing and backups

SET functions update the selected DAT file at the same path. PyroApp constructs and validates the edit, writes a temporary sibling file, and atomically replaces the original only after the replacement is ready. This protects against partial file corruption but does not protect against an unwanted *valid* parameter change. Keep important source databases in version control or backup them before editing.

## Interaction descriptions

PyroApp obtains interaction identities and powers from the parsed DAT semantics. It does not rely on ChemApp `TQLPAR` display text because native display formatting can be ambiguous for interaction powers above 9.
