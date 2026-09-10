# PyroApp 1.x installation (legacy)

PyroApp 1.x was the Python/xlwings implementation. It is retained for historical workbooks and as a behavioral reference for the PyroApp 2 port.

A legacy installation requires a compatible Python environment, the PyroApp Python package and its dependencies, xlwings Excel integration, and a compatible licensed ChemApp/ChemApp-proxy setup. Some historical deployments also used an `xlwings.conf` worksheet to identify the Python interpreter and runtime paths.

## Should I install 1.x?

For a new workbook, use PyroApp 2. It has native Excel-DNA registration, dynamic-array integration, asynchronous execution and isolated Rust/ChemApp workers without requiring a user-managed Python runtime.

Install 1.x only when you need to reproduce or maintain an existing workbook whose formulas/macros depend on the Python version.

## Formula migration

Legacy formulas commonly used names such as:

```text
CA_LIST_PHASES
CA_GET_COMPOUND_H298
CA_CALCULATE
```

PyroApp 2 registers the current Excel versions with an `XLL_` prefix:

```text
XLL_CA_LIST_PHASES
XLL_CA_GET_COMPOUND_H298
XLL_CA_CALCULATE
```

Do not run both implementations in the same workbook without a deliberate migration plan.
