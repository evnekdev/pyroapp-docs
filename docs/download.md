# Downloads

PyroApp release packages are distributed on an **approval-controlled basis** rather than through an anonymous public download. Each published version has separate x64 and x86 installers. Access to the installer files is controlled in Google Drive.

The intended primary PyroSearch package is:

```text
PyroApp for 64-bit Excel
Bundled ChemApp runtime
```

The controlled bundled package includes the required ChemApp runtime files for its architecture. A valid ChemApp licence remains required for calculations; the package neither grants a licence nor implies unrestricted ChemApp redistribution rights.

Two IPC client architectures are supported:

- **x64** — for 64-bit Excel / matching local runtime;
- **x86** — for 32-bit Excel / matching local runtime.

A release package must be kept intact because the XLL relies on companion native/runtime files. Do not extract or copy only the `.xll` and discard the rest of the installed package.

## Current installers

Current published version: **0.1.0**

| Architecture | Installer | Size | SHA-256 | Status |
|---|---|---:|---|---|
| x64 | [PyroApp-0.1.0-x64-Setup.exe](https://drive.google.com/file/d/1MhdTXaq0vn4rNXxLjPrmRAQDnYKW8ajj/view?usp=drivesdk) | 77,510,254 bytes | `aaa58bba8bbc452a0a2c27fc37e184f6c69e3e58d32eda1b2c45507af6d4f67c` | Primary bundled installer |
| x86 | [PyroApp-0.1.0-x86-Setup.exe](https://drive.google.com/file/d/1Oo9Y2WzDnK7KwtUNEyn5ZunjuxTWCRN6/view?usp=drivesdk) | 4,099,372 bytes | `57ea8bf7ada21fafd852c8c1c6f97a94e1ee36707b4d3f76506551f559fd9da0` | Interim current x86 build; package-parity correction pending |

!!! warning "Current x86 package"
    The current x86 installer is substantially smaller than the x64 bundled installer. It is published here as the current 32-bit build, but it should **not** yet be assumed to contain the same bundled runtime payload as x64. A packaging-parity correction is in progress. The x64 installer remains the reference package.

!!! note "Controlled Drive access"
    These Google Drive files are not anonymous public downloads. Approved users must have Viewer access to the individual installer file. If a link opens an access-request page, the installer has not yet been shared with that Google account.

## Legacy workbook migrator

The **PyroApp Workbook Migrator** is included with every current PyroApp installer. The production migrator is the compiled architecture-specific Rust executable installed with PyroApp and launched by the PyroApp Ribbon.

The migrator runs locally on Windows and uses the installed desktop Microsoft Excel application. It converts legacy `.xlsm` workbooks to macro-free `.xlsx`, rewrites recognized legacy PyroApp formulas to their current `XLL_*` equivalents, preserves workbook content through Excel's own serializer, and never overwrites the original workbook.

During migration it also enforces the PyroApp three-row-header convention: physically empty cells in the **phase** and **constituent/component** rows of referenced `CA_CALCULATE` input/output headers are replaced with `=""`. The cell therefore evaluates to the empty string but remains populated, keeping the header contiguous and easy to select and manipulate.

VBA/macros are intentionally removed because `.xlsx` does not contain a VBA project. If the migrator encounters a legacy PyroApp function or a `CA_CALCULATE` header reference for which there is no approved safe automatic migration, it stops and reports the exact location instead of silently producing a partially migrated workbook.

## PyroApp installers

Use the installer matching the bitness shown by **Excel → File → Account → About Excel**.

The installers above are stored in the private **PyroApp Distribution** Drive folder. The folder itself is not a public distribution endpoint; the links above identify the exact current installer files.

When a corrected x86 package is published, this page must be updated to the replacement Drive file and checksum rather than silently changing the meaning of the current link.

### External ChemApp packages

An `ExternalChemApp` installer is an advanced/developer package. It contains no ChemApp DLLs and asks for an existing licensed runtime with matching Excel bitness. It is not the normal controlled PyroSearch package.

!!! warning
    Do not use an unofficial copy of a PyroApp bundle or ChemApp native library. ChemApp licensing and protected datafile permissions still apply.
