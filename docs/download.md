# Downloads

PyroApp release packages are distributed through UQ Microsoft 365 rather than through an anonymous public download. Each published version has separate x64 and x86 installers. Use the installer link below for the Excel architecture installed on your computer.

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

| Architecture | Installer | Status |
|---|---|---|
| x64 | [PyroApp-0.1.0-x64-Setup.exe](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x64-Setup.exe?d=w61c832d74c784bdf93c986717d6ea66b&csf=1&web=1&e=2oZXGy) | Current bundled installer |
| x86 | [PyroApp-0.1.0-x86-Setup.exe](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x86-Setup.exe?d=w2dc1b2eda1ee47c2aa7d74b89e5f0957&csf=1&web=1&e=mJ3kaf) | Current bundled installer |

The installer links above point to the current published files. Previous size and SHA-256 values have been removed because they described older binaries; checksums should only be republished after they are independently calculated from these exact installer files.

!!! note "UQ SharePoint access"
    These installer files are stored in the UQ Microsoft 365 `PYROAPP INSTALLER` folder. If Microsoft requests authentication, use an account that has been granted access to the shared files.

## Legacy workbook migrator

For the complete user workflow, see **[Legacy PyroApp 1.x migration](migration-1.0.md)**.

The **PyroApp Workbook Migrator** is included with every current PyroApp installer. The production migrator is the compiled architecture-specific Rust executable installed with PyroApp and launched by the PyroApp Ribbon.

The migrator runs locally on Windows and uses the installed desktop Microsoft Excel application. It rewrites every supported legacy PyroApp function to its current `XLL_*` equivalent, preserves workbook content through Excel's own serializer, and never overwrites the original workbook.

Before migration, the graphical migrator inventories other workbook UDFs that do not have a mandatory PyroApp mapping. For each one, the user can choose **Keep active** or **Comment out**. Commented formulas are preserved as visible formula text so they can be found and replaced later. If any residual UDF is kept active, the output remains macro-enabled `.xlsm` and the workbook's VBA/xlwings support is preserved. If none are kept, the result is macro-free `.xlsx`.

During migration it also enforces the PyroApp three-row-header convention: physically empty cells in the **phase** and **constituent/component** rows of referenced `CA_CALCULATE` input/output headers are replaced with the literal text `""`. PyroApp treats this marker as an empty field while the header cell remains populated, keeping the header contiguous and easy to select and manipulate. Macros remain disabled throughout preflight, migration, and reopen verification.

## PyroApp installers

Use the installer matching the bitness shown by **Excel → File → Account → About Excel**.

The links above identify the exact current installer files in the UQ Microsoft 365 **PYROAPP INSTALLER** folder.

### External ChemApp packages

An `ExternalChemApp` installer is an advanced/developer package. It contains no ChemApp DLLs and asks for an existing licensed runtime with matching Excel bitness. It is not the normal controlled PyroSearch package.

!!! warning
    Do not use an unofficial copy of a PyroApp bundle or ChemApp native library. ChemApp licensing and protected datafile permissions still apply.
