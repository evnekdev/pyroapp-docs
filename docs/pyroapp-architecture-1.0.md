# PyroApp 1.x architecture (legacy)

PyroApp 1.x connected Excel to Python through xlwings. Python/Cython code then called a ChemApp proxy/native library and returned arrays to Excel.

```mermaid
graph LR
  E[Excel] --> X[xlwings]
  X --> P[Python / Cython PyroApp]
  P --> C[ChemApp proxy / native library]
```

This design proved the worksheet API and thermodynamic workflows, but it required a Python installation and introduced process/startup/configuration overhead. It also had weaker integration with Excel function metadata than a compiled XLL.

PyroApp 2 preserves the useful worksheet concepts while replacing the Excel boundary with Excel-DNA/C#, moving datafile parsing into Rust, and isolating ChemApp execution in worker processes.

The legacy Python implementation remains valuable as a behavioral reference when validating calculation semantics. Clear legacy bugs are not intentionally reproduced when the documented interface and ChemApp semantics establish the intended behavior.
