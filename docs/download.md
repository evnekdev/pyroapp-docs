# Downloads

PyroApp 2 release packages are currently distributed on an **approval-controlled basis** rather than through an anonymous public download.

Two IPC client builds are planned for distribution:

- **x64** — for 64-bit Excel / matching local runtime;
- **x86** — for 32-bit Excel / matching local runtime.

A release package must be kept intact because the XLL relies on companion native/runtime files. Do not download only the `.xll` from a package and discard the rest.

## Legacy workbook migrator

The **PyroApp Workbook Migrator 0.2.0** is available separately and is intended for users moving old PyroApp workbooks to PyroApp 2.

[Download PyroApp Workbook Migrator 0.2.0](https://drive.google.com/file/d/1-14HHP9mFK8V7T9mCoNW9-E_40U9XJ43/view?usp=drivesdk){ .md-button .md-button--primary }

The migrator runs locally on Windows and uses the installed desktop Microsoft Excel application. It converts legacy `.xlsm` workbooks to macro-free `.xlsx`, rewrites recognized legacy PyroApp formulas to their current `XLL_*` equivalents, preserves workbook content through Excel's own serializer, and never overwrites the original workbook.

During migration it also enforces the PyroApp 2 three-row-header convention: physically empty cells in the **phase** and **constituent/component** rows of referenced `CA_CALCULATE` input/output headers are replaced with `=""`. The cell therefore evaluates to the empty string but remains populated, keeping the header contiguous and easy to select and manipulate.

VBA/macros are intentionally removed because `.xlsx` does not contain a VBA project. If the migrator encounters a legacy PyroApp function or a `CA_CALCULATE` header reference for which there is no approved safe automatic migration, it stops and reports the exact location instead of silently producing a partially migrated workbook.

!!! note
    The migrator download is intended to be publicly accessible. If Google Drive reports that access is restricted, the file owner must set **General access → Anyone with the link → Viewer** in Google Drive. This permission cannot currently be created by the connected Drive automation used to publish the file.

## PyroApp 2 installers

The release workflow is being finalized. Approved PyroApp 2 packages will be published through a controlled download location once the x86/x64 compilation, installer and packaging scripts are complete.

This page will contain the canonical installer links and version/checksum information when those bundles are available.

!!! warning
    Do not use an unofficial copy of a PyroApp bundle or ChemApp native library. ChemApp licensing and protected datafile permissions still apply.
