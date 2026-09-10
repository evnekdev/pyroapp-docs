# Downloads

PyroApp release packages are distributed on an **approval-controlled basis** rather than through an anonymous public download. Each published version has separate signed x64 and x86 installers, matching portable ZIPs, SHA-256 checksums, and a release manifest.

Two IPC client builds are planned for distribution:

- **x64** — for 64-bit Excel / matching local runtime;
- **x86** — for 32-bit Excel / matching local runtime.

A release package must be kept intact because the XLL relies on companion native/runtime files. Do not download only the `.xll` from a package and discard the rest.

## Legacy workbook migrator

The **PyroApp Workbook Migrator** is included with every PyroApp installer and portable package. It is also packaged separately from the source-controlled `tools/workbook-migrator` tool for controlled distribution. The product links are published only after a signed release has passed the installed-Excel and ChemApp smoke gates.

The migrator runs locally on Windows and uses the installed desktop Microsoft Excel application. It converts legacy `.xlsm` workbooks to macro-free `.xlsx`, rewrites recognized legacy PyroApp formulas to their current `XLL_*` equivalents, preserves workbook content through Excel's own serializer, and never overwrites the original workbook.

During migration it also enforces the PyroApp three-row-header convention: physically empty cells in the **phase** and **constituent/component** rows of referenced `CA_CALCULATE` input/output headers are replaced with `=""`. The cell therefore evaluates to the empty string but remains populated, keeping the header contiguous and easy to select and manipulate.

VBA/macros are intentionally removed because `.xlsx` does not contain a VBA project. If the migrator encounters a legacy PyroApp function or a `CA_CALCULATE` header reference for which there is no approved safe automatic migration, it stops and reports the exact location instead of silently producing a partially migrated workbook.

!!! note
    The controlled publisher sets the exact Drive access list for a release. Do not rely on a copied or anonymous XLL: obtain the installer, portable ZIP, and checksum file from the approved release location together.

## PyroApp installers

The release workflow is being finalized. Approved PyroApp packages will be published through a controlled download location once the x86/x64 compilation, signing, installer, and installed-Excel/ChemApp smoke checks are complete.

This page will contain the canonical installer links and version/checksum information when those bundles are available.

!!! warning
    Do not use an unofficial copy of a PyroApp bundle or ChemApp native library. ChemApp licensing and protected datafile permissions still apply.
