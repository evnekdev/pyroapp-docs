# Tutorial datafiles and Figure files

These are the public data assets used by the practical PyroApp tutorials.

## Publication rules

The tutorial repository follows these rules:

- **FIG files may be published**.
- **CST files are not published**.
- A ChemApp **DAT** may be published only when its thermodynamic system contains **no more than four chemical elements**.
- Electron/pseudo-components such as `e(Spinel)` are not counted as chemical elements.
- Files that happen to use a `.DAT` extension but are FactSage Equilib/Phase Diagram control files are not presented as PyroApp thermodynamic datafiles.

!!! note "Use a working copy for parameter editing"
    PyroApp DAT SET functions modify the selected DAT. Download a fresh copy before an optimization exercise and keep the original unchanged.

## General tutorial DAT files

| Datafile | Chemical elements | Count | Notes |
| --- | --- | ---: | --- |
| [Al-Ca-O.dat](../tutorial-assets/datafiles/examples/Al-Ca-O.dat) | Al, Ca, O | 3 | Includes an electron pseudo-component for Spinel |
| [Al-Ca-O_var.dat](../tutorial-assets/datafiles/examples/Al-Ca-O_var.dat) | Al, Ca, O | 3 | Variable/working variant |
| [Al-Si-Zn-O.dat](../tutorial-assets/datafiles/examples/Al-Si-Zn-O.dat) | Al, Si, Zn, O | 4 | Includes electron pseudo-components for Spinel/Mullite |
| [Al-Si-Zn-O_var.dat](../tutorial-assets/datafiles/examples/Al-Si-Zn-O_var.dat) | Al, Si, Zn, O | 4 | Variable/working variant |
| [C-H-O.dat](../tutorial-assets/datafiles/examples/C-H-O.dat) | C, H, O | 3 | Gas/combustion calculations |
| [Ca-Zn-O.dat](../tutorial-assets/datafiles/examples/Ca-Zn-O.dat) | Ca, Zn, O | 3 | Simple binary-oxide teaching system |
| [cosi.dat](../tutorial-assets/datafiles/examples/cosi.dat) | C, O, Si | 3 | Compact legacy ChemApp example |

## Optimization tutorial DAT files

These are the initial working datafiles from the Ca-Zn-Si-O tutorial.

| Subsystem | Datafile | Chemical elements | Count |
| --- | --- | --- | ---: |
| Ca-Si-O | [INITIAL_Ca-Si-O.dat](../tutorial-assets/datafiles/optimization/01_Ca-Si-O/INITIAL_Ca-Si-O.dat) | Ca, Si, O | 3 |
| Ca-Zn-O | [INITIAL_Ca-Zn-O.dat](../tutorial-assets/datafiles/optimization/02_Ca-Zn-O/INITIAL_Ca-Zn-O.dat) | Ca, Zn, O | 3 |
| Zn-Si-O | [INITIAL_Zn-Si-O.dat](../tutorial-assets/datafiles/optimization/03_Zn-Si-O/INITIAL_Zn-Si-O.dat) | Zn, Si, O | 3 |
| Ca-Zn-Si-O | [INITIAL_Ca-Zn-Si-O.dat](../tutorial-assets/datafiles/optimization/04_Ca-Zn-Si-O/INITIAL_Ca-Zn-Si-O.dat) | Ca, Zn, Si, O | 4 |

The element counts above were checked from the actual ChemApp component headers. In particular, files with electron pseudo-components can have more ChemApp components than chemical elements while still satisfying the four-element publication rule.

## General Figure files

These legacy FactSage Figure files accompany the Al-Si-Zn-O examples:

- [MERGED Al-Si-Zn-O ternary figure](../tutorial-assets/figures/examples/MERGED_Al-Si-Zn-O_SiO2-ZnO-Al2O3.fig)
- [Al-Si-Zn-O isothermal phase-diagram figure](../tutorial-assets/figures/examples/PhasDMS15_Al-Si-Zn-O_SiO2-ZnO-Al2O3_iso.fig)
- [Al-Si-Zn-O univariant phase-diagram figure](../tutorial-assets/figures/examples/PhasDMS15_Al-Si-Zn-O_SiO2-ZnO-Al2O3_univ.fig)

## Optimization Figure files

### Ca-Si-O

- [Reference phase diagram](../tutorial-assets/figures/optimization/01_Ca-Si-O/REFERENCE_Ca-Si-O_CaO-SiO2.FIG)
- [Target-point figure](../tutorial-assets/figures/optimization/01_Ca-Si-O/TARGETS_Ca-Si-O_CaO-SiO2.FIG)

### Ca-Zn-O

- [Reference phase diagram](../tutorial-assets/figures/optimization/02_Ca-Zn-O/REFERENCE_Ca-Zn-O_CaO-ZnO.fig)
- [Target-point figure](../tutorial-assets/figures/optimization/02_Ca-Zn-O/TARGETS_Ca-Zn-O_CaO-ZnO.fig)

### Zn-Si-O

- [Reference phase diagram](../tutorial-assets/figures/optimization/03_Zn-Si-O/REFERENCE_Zn-Si-O_ZnO-SiO2.FIG)
- [Target-point figure](../tutorial-assets/figures/optimization/03_Zn-Si-O/TARGETS_Zn-Si-O_ZnO-SiO2.FIG)

### Ca-Zn-Si-O

- [Reference ternary phase diagram](../tutorial-assets/figures/optimization/04_Ca-Zn-Si-O/REFERENCE_Ca-Si-Zn-O_SiO2-CaO-ZnO_univiso.fig)
- [Target-point ternary figure](../tutorial-assets/figures/optimization/04_Ca-Zn-Si-O/TARGETS_Ca-Si-Zn-O_SiO2-CaO-ZnO_univiso.fig)

The files are supplied in their native Figure-file format for inspection in the corresponding Figure tool.

## Deliberately not published

### CST

No `.cst` files are included in the public tutorial assets.

### FactSage control DAT files

The legacy source tree also contains files such as `eEqui0.DAT`, `pPhas0.DAT`, `EquiCHEMSAGEGEN_*.DAT`, and `PhasDENDB_*.DAT`. These are FactSage Equilib/Phase Diagram setup/control files, not ChemApp thermodynamic DAT datafiles, so they are excluded from the PyroApp datafile download list.

### Duplicate Figure copy

The legacy `TARGETS_Ca-Si-Zn-O_SiO2-CaO-ZnO_univiso - Copy.fig` file is an obvious duplicate working copy and is not published.
