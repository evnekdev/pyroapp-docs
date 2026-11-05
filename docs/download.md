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

## Official releases

The latest **accepted official release** recorded here is **PyroApp 0.1.0**. Releases remain available by version as new versions are accepted. The 0.1.1 installer pair and changelog have been staged, but official release acceptance is not yet confirmed.

### Version 0.1.0 — current available release

Source: [`v0.1.0`](https://github.com/evnekdev/pyroapprs/tree/v0.1.0) at [`13fb5a1`](https://github.com/evnekdev/pyroapprs/commit/13fb5a1add84fb3c7bccfc807d11fe74575fbfb4) (source commit dated 25 September 2026). The publication date is not independently recorded.

| Architecture | Installer | Availability |
|---|---|---|
| x64 | [PyroApp-0.1.0-x64-Setup.exe](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x64-Setup.exe?d=w61c832d74c784bdf93c986717d6ea66b&csf=1&web=1&e=nx4sIc) | Published link; bundled ChemApp |
| x86 | [PyroApp-0.1.0-x86-Setup.exe](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x86-Setup.exe?d=w2dc1b2eda1ee47c2aa7d74b89e5f0957&csf=1&web=1&e=8sirYl) | Published link; confirm matching payload and acceptance before use |

The original official **x64 reference installer** was independently checked against SHA-256 `759610272fd7439043b0ae4ea25901a907715f5b0cd684080600dcf92a7839f4`. The bytes currently served by the SharePoint URL have **not** been independently checked against this reference; verify the downloaded file before assuming it matches. An independently verified hash for the linked x86 installer is not available.

### Version 0.1.1 — staged installers (release acceptance pending)

The following versioned installer links and changelog have been supplied for **0.1.1**. They are **staged candidates**, not yet verified as accepted official release artifacts. Their downloaded bytes, signatures, and checksums have not been independently inspected for this page. No official `v0.1.1` tag or accepted release date is recorded.

| Architecture | Staged installer | Status |
|---|---|---|
| x64 | [PyroApp-0.1.1-x64-Setup.exe](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x64-Setup.exe?d=wa0cc65ce61984c5d9b5903cbb7a59195&csf=1&web=1&e=NYPMCD) | Acceptance pending |
| x86 | [PyroApp-0.1.1-x86-Setup.exe](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x86-Setup.exe?d=w036c3e16d1a8419ebb72d6de4fa15f3a&csf=1&web=1&e=8hCALy) | Acceptance pending |

**Changelog:** [CHANGELOG-0.1.1.md](https://uq-my.sharepoint.com/:t:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/CHANGELOG-0.1.1.md?d=w675f38fd7ede474e9dffe5e166357c62&csf=1&web=1&e=np7z7t)

These links do not themselves prove installed-product acceptance. **0.1.0 remains the latest accepted official release** until the 0.1.1 build and verification evidence are completed.

### Release history

| Version | Status | x64 | x86 |
|---|---|---|---|
| **0.1.1** | Staged; release acceptance pending | [Candidate](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x64-Setup.exe?d=wa0cc65ce61984c5d9b5903cbb7a59195&csf=1&web=1&e=NYPMCD) | [Candidate](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x86-Setup.exe?d=w036c3e16d1a8419ebb72d6de4fa15f3a&csf=1&web=1&e=8hCALy) |
| **0.1.0** | Latest available | [Download](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x64-Setup.exe?d=w61c832d74c784bdf93c986717d6ea66b&csf=1&web=1&e=nx4sIc) | [Download](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x86-Setup.exe?d=w2dc1b2eda1ee47c2aa7d74b89e5f0957&csf=1&web=1&e=8sirYl) |

The installer filenames already contain their versions; there is no need to rename the `0.1.0` installers. When a new official release is published, add its own versioned entries and retain older links rather than replacing them.

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

The release-history links identify versioned installer files in the UQ Microsoft 365 **PYROAPP INSTALLER** folder.

### External ChemApp packages

An `ExternalChemApp` installer is an advanced/developer package. It contains no ChemApp DLLs and asks for an existing licensed runtime with matching Excel bitness. It is not the normal controlled PyroSearch package.

!!! warning
    Do not use an unofficial copy of a PyroApp bundle or ChemApp native library. ChemApp licensing and protected datafile permissions still apply.
