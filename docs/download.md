# Downloads

PyroApp is a Microsoft Excel add-in for Windows. Choose the installer that matches the **architecture of Excel** (64-bit or 32-bit), not the architecture of Windows. Installers and release notes are hosted on UQ Microsoft 365; access may require a permitted account.

## Downloads by version

| Version | Release date | Status | x64 — 64-bit Excel | x86 — 32-bit Excel | Release notes |
|---|---|---|---|---|---|
| **0.1.1** | Not released; links staged **5 Nov 2026** | **Staged candidate** — acceptance pending | [Download x64 installer](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x64-Setup.exe?d=wa0cc65ce61984c5d9b5903cbb7a59195&csf=1&web=1&e=NYPMCD) | [Download x86 installer](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.1-x86-Setup.exe?d=w036c3e16d1a8419ebb72d6de4fa15f3a&csf=1&web=1&e=8hCALy) | [CHANGELOG-0.1.1.md](https://uq-my.sharepoint.com/:t:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/CHANGELOG-0.1.1.md?d=w675f38fd7ede474e9dffe5e166357c62&csf=1&web=1&e=np7z7t) |
| **0.1.0** | First documented **17 Sep 2026** | **Current official release** | [Download x64 installer](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x64-Setup.exe?d=w61c832d74c784bdf93c986717d6ea66b&csf=1&web=1&e=nx4sIc) | [Download x86 installer](https://uq-my.sharepoint.com/:u:/r/personal/uqenekho_uq_edu_au/Documents/PYROAPP%20INSTALLER/PyroApp-0.1.0-x86-Setup.exe?d=w2dc1b2eda1ee47c2aa7d74b89e5f0957&csf=1&web=1&e=8sirYl) | Initial release; [source tag v0.1.0](https://github.com/evnekdev/pyroapprs/tree/v0.1.0) |

**About the dates:** The 0.1.0 date is the first documented publication of installer links, not a verified build date for the files currently linked. Its current reference source is [commit `13fb5a1`](https://github.com/evnekdev/pyroapprs/commit/13fb5a1add84fb3c7bccfc807d11fe74575fbfb4) from **25 September 2026**; the exact date those particular installer bytes were published is not recorded. The 0.1.1 date indicates when its links were staged, **not** an official release date. It has not yet completed documented release acceptance.

**Installer verification:** The original 0.1.0 x64 reference installer was verified against SHA-256 `759610272fd7439043b0ae4ea25901a907715f5b0cd684080600dcf92a7839f4`. The bytes currently served through SharePoint have not been independently checked against that reference. Verified checksums are not yet recorded for the linked 0.1.0 x86 or 0.1.1 candidates. Do not interpret link availability as release acceptance.

## Choose and install the correct package

1. In desktop Excel, open **File → Account → About Excel** and check whether Excel is 64-bit or 32-bit.
2. Select the matching **x64** or **x86** installer from the table. Use **0.1.0** for the current official release; **0.1.1** is available only as a staged candidate pending acceptance.
3. Run the installer using its normal Windows setup workflow. Keep the installed package intact: the XLL requires architecture-matched companion worker, DAT ABI, and runtime files. Copying only the `.xll` will not create a working installation.

The standard PyroSearch distribution bundles the matching ChemApp runtime. A valid ChemApp licence is still required for calculations; the installer does not grant a licence or unrestricted permission to redistribute ChemApp. An `ExternalChemApp` package, when provided separately, is an advanced/developer variant that uses an existing licensed runtime rather than the normal bundled package.

## Migrating legacy workbooks

Current PyroApp installers include the **PyroApp Workbook Migrator**, launched from the PyroApp Ribbon. It uses desktop Excel to translate supported legacy formulas without overwriting the original workbook. Unmapped UDFs can be kept active or converted to visible text according to the user's choices, with output saved as `.xlsx` or `.xlsm` as appropriate.

See [Legacy PyroApp 1.x migration](migration-1.0.md) for the full procedure, safety checks, and workbook-format rules.

## Access and safety

The links above point to files in the UQ Microsoft 365 **PYROAPP INSTALLER** folder. If SharePoint requests authentication, use an account that has been granted access to the files.

Only install packages supplied through the controlled distribution. ChemApp licensing and protected datafile permissions remain in force for every version.
