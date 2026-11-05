# Downloads

Download the PyroApp installer for your version of Microsoft Excel on Windows. All versions remain available through UQ Microsoft 365.

## Available versions

**Latest release: PyroApp 0.1.1**

| Version | Release date | x64 — 64-bit Excel | x86 — 32-bit Excel | Release notes |
|---|---|---|---|---|
| **0.1.1** | 5 November 2026 | [Download x64](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x64-Setup.exe?d=wa0cc65ce61984c5d9b5903cbb7a59195&csf=1&web=1&e=NYPMCD) | [Download x86](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x86-Setup.exe?d=w036c3e16d1a8419ebb72d6de4fa15f3a&csf=1&web=1&e=8hCALy) | [What's new in 0.1.1](https://uq-my.sharepoint.com/:t:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/CHANGELOG-0.1.1.md?d=w675f38fd7ede474e9dffe5e166357c62&csf=1&web=1&e=np7z7t) |
| **0.1.0** | 17 September 2026 | [Download x64](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x64-Setup.exe?d=w61c832d74c784bdf93c986717d6ea66b&csf=1&web=1&e=nx4sIc) | [Download x86](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x86-Setup.exe?d=w2dc1b2eda1ee47c2aa7d74b89e5f0957&csf=1&web=1&e=8sirYl) | Initial release |

## Installation

1. In Excel, select **File → Account → About Excel** to check whether you have 64-bit or 32-bit Excel.
2. Download the corresponding **x64** or **x86** installer from the table.
3. Run Setup and follow the installation instructions.

Select the installer for **Excel's architecture**, which may differ from your Windows architecture. Keep the installed package intact: the Excel add-in (`.xll`) depends on matching worker, DAT ABI and runtime components.

## ChemApp and licensing

The standard PyroSearch installers include the architecture-matched ChemApp runtime. Calculations still require a valid ChemApp licence. Installing PyroApp does not grant a ChemApp licence or unrestricted redistribution rights.

The `ExternalChemApp` package, when separately provided, is an advanced/developer option that uses an existing licensed ChemApp runtime.

## Legacy workbook migration

PyroApp includes a **Workbook Migrator** launched from its Excel Ribbon. It converts supported legacy PyroApp formulas while preserving the original workbook and allows you to review other user-defined functions.

For instructions and workbook-format options, see [Legacy PyroApp 1.x migration](migration-1.0.md).

## Download access

Installers and release notes are hosted in the UQ Microsoft 365 **PYROAPP INSTALLER** folder. If SharePoint requests sign-in, use an account with access to the shared files.
