# Downloads

PyroApp release packages are distributed on an **approval-controlled basis** rather than through an anonymous public download. Each published version has separate x64 and x86 installers. Access to the installer files is inherited from the UQ Microsoft Teams / SharePoint group.

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
| x64 | [PyroApp-0.1.0-x64-Setup.exe](https://uq.sharepoint.com/:u:/r/teams/zhbggcmqxf/Shared%20Documents/General/PyroApp%20Distribution/PyroApp-0.1.0-x64-Setup.exe?d=wacfcc83134254a6aa3c41234fc9ac0e2&csf=1&web=1&e=rG3hdD) | 77,510,254 bytes | `aaa58bba8bbc452a0a2c27fc37e184f6c69e3e58d32eda1b2c45507af6d4f67c` | Primary bundled installer |
| x86 | [PyroApp-0.1.0-x86-Setup.exe](https://uq.sharepoint.com/:u:/r/teams/zhbggcmqxf/Shared%20Documents/General/PyroApp%20Distribution/PyroApp-0.1.0-x86-Setup.exe?d=w7fa8a43d052247f4a527b71b4b22cb43&csf=1&web=1&e=PM0b0d) | 4,099,372 bytes | `57ea8bf7ada21fafd852c8c1c6f97a94e1ee36707b4d3f76506551f559fd9da0` | Interim current x86 build; package-parity correction pending |

!!! warning "Current x86 package"
    The current x86 installer is substantially smaller than the x64 bundled installer. It is published here as the current 32-bit build, but it should **not** yet be assumed to contain the same bundled runtime payload as x64. A packaging-parity correction is in progress. The x64 installer remains the reference package.

!!! note "UQ Team access"
    These installer files are stored in the UQ Team's SharePoint document library. Access is inherited from the Team: members can open the links using their normal UQ Microsoft 365 sign-in, while users outside the Team are denied access. No public sharing is enabled.

## Legacy workbook migrator

The **PyroApp Workbook Migrator** is included with every current PyroApp installer. The production migrator is the compiled architecture-specific Rust executable installed with PyroApp and launched by the PyroApp Ribbon.

The migrator runs locally on Windows and uses the installed desktop Microsoft Excel application. It converts legacy `.xlsm` workbooks to macro-free `.xlsx`, rewrites recognized legacy PyroApp formulas to their current `XLL_*` equivalents, preserves workbook content through Excel's own serializer, and never overwrites the original workbook.

During migration it also enforces the PyroApp three-row-header convention: physically empty cells in the **phase** and **constituent/component** rows of referenced `CA_CALCULATE` input/output headers are replaced with `=""`. The cell therefore evaluates to the empty string but remains populated, keeping the header contiguous and easy to select and manipulate.

VBA/macros are intentionally removed because `.xlsx` does not contain a VBA project. If the migrator encounters a legacy PyroApp function or a `CA_CALCULATE` header reference for which there is no approved safe automatic migration, it stops and reports the exact location instead of silently producing a partially migrated workbook.

## PyroApp installers

Use the installer matching the bitness shown by **Excel → File → Account → About Excel**.

The installers above are stored in **General → PyroApp Distribution** in the UQ Microsoft Team's SharePoint document library. The links identify the exact current installer files and rely on the Team's existing access permissions.

When a corrected x86 package is published, this page must be updated to the replacement SharePoint file and checksum rather than silently changing the meaning of the current link.

### External ChemApp packages

An `ExternalChemApp` installer is an advanced/developer package. It contains no ChemApp DLLs and asks for an existing licensed runtime with matching Excel bitness. It is not the normal controlled PyroSearch package.

!!! warning
    Do not use an unofficial copy of a PyroApp bundle or ChemApp native library. ChemApp licensing and protected datafile permissions still apply.
