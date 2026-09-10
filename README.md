# PyroApp documentation

This repository contains the user documentation for **PyroApp**, an Excel add-in for thermodynamic calculations and ChemSage/ChemApp datafile work.

The published site is: https://evnekdev.github.io/pyroapp-docs/

## Build locally

```bash
python -m pip install -r requirements-docs.txt
mkdocs serve
```

Validate all navigation and internal links before deployment:

```bash
mkdocs build --strict
```

The `master` branch is deployed automatically to GitHub Pages.

The documentation describes the current Excel-DNA/Rust implementation in `evnekdev/pyroapprs`. PyroApp 1.x is retained only as a legacy reference.