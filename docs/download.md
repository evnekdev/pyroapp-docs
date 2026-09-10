# Downloads

PyroApp release packages are distributed on an **approval-controlled basis** rather than through an anonymous public download. Each published version has separate signed x64 and x86 installers, matching portable ZIPs, SHA-256 checksums, a release manifest, and publication metadata.

The intended primary PyroSearch package is:

```text
PyroApp for 64-bit Excel
Bundled ChemApp runtime
```

The controlled package includes the required ChemApp runtime files for its architecture. A valid ChemApp licence remains required for calculations; the package neither grants a licence nor implies unrestricted ChemApp redistribution rights.

Two IPC client architectures are supported:

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

The release workflow is being finalized. Approved PyroApp packages will be published through the private **PyroApp Distribution** Drive folder only after architecture checks, signing, installer validation, installed-Excel smoke, and ChemApp smoke all pass. The folder itself is not shared; access is granted as Viewer permission on each approved installer file.

The canonical installer links and version/checksum information will appear here after publication. No download URL is published until it points to the final verified artifact.

### External ChemApp packages

An `ExternalChemApp` installer is an advanced/developer package. It contains no ChemApp DLLs and asks for an existing licensed runtime with matching Excel bitness. It is not the normal controlled PyroSearch package.

!!! warning
    Do not use an unofficial copy of a PyroApp bundle or ChemApp native library. ChemApp licensing and protected datafile permissions still apply.
