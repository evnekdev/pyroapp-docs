# Capstone: organize a Ca-Zn-Si-O optimization

The original continuous-optimization tutorial used Ca-Zn-Si-O because its three binary subsystems expose different modeling difficulties before they are combined in a ternary assessment.

This page keeps that teaching strategy while replacing the Python/xlwings workflow with PyroApp 2.

## Fit subsystems first

Treat the assessment hierarchically:

1. Ca-Si-O;
2. Ca-Zn-O;
3. Zn-Si-O;
4. Ca-Zn-Si-O.

A ternary parameter should not hide a poor binary description.

For each subsystem keep:

- initial DAT;
- working DAT;
- experimental/reference target table;
- current calculated values;
- residuals, weights and masks;
- parameter table;
- derivative matrix;
- fit-quality summary.

## Target classes

### Liquidus and solidus

Use temperature targets at fixed experimental compositions and verify the intended stable phases.

### Invariant equilibria

Return invariant temperature and, where relevant, solution compositions. Verify all participating phases are stable with activities and/or `NSTABLE`.

### Solid-solution compositions

Steep solubility boundaries can be difficult as temperature targets. An isothermal calculation may be more robust:

- enter the experimentally stable phases;
- construct a compatible bulk composition;
- output solution composition with `XP`;
- compare calculated and experimental compositions.

### Mixing functions

For G, H or S of mixing:

- construct a composition grid;
- set T/P;
- constrain the intended solution phase where appropriate;
- request `G`, `H` or `S`;
- compare the calculated mixing curve with thermochemical targets.

## Recommended workbook structure

### Targets

```text
ID | System | Type | Category | Target | Current | Residual | Weight | Valid | ERROR
```

Keep full experimental metadata elsewhere; this normalized table is the optimization interface.

### Calculations

Group physically similar `XLL_CA_CALCULATE` tables:

- liquidus targets;
- invariants;
- isothermal solid-solution points;
- mixing properties.

Do not force physically different problems into one giant header.

### Parameters

Keep parameter identity, current value, subsystem, active/free switch, derivative step, proposed `Δp`, damping and proposed new value.

Keep SET formulas visually separate from editable numeric parameter values.

### Optimization

Keep B1:B6 derivative configuration, normalized residual vector, Jacobian, `XLL_LINEAR_REGRESSION`, optional `XLL_BEST_COMBINATION`, `XLL_PD_ERROR_TABLE`, and current-versus-predicted diagnostics.

## Iteration strategy

1. obtain a physically reasonable manual start;
2. fit binaries with small parameter sets;
3. recalculate all binary diagrams/properties;
4. freeze or strongly constrain established binary parameters;
5. add ternary targets;
6. test only chemically plausible ternary parameters;
7. apply damped updates;
8. recalculate binaries and ternary after meaningful updates;
9. stop when further RMS improvement requires physically unreasonable behavior.

## Do not copy these legacy mechanics

- `xlwings.conf`;
- Python interpreter paths;
- Python/IPython derivative scripts;
- manual thread splitting of `ca_calculate`;
- `plot_data`;
- `calculate_binary`;
- cached Python tracebacks.

Use current XLL formulas and ordinary Excel charts.

## Modeling background

The old guide also contains useful theory on FactSage solution models, sublattices, endmembers, species, excess interactions, short-range ordering and database construction.

That material belongs in an advanced thermodynamic-modeling section rather than being a prerequisite for learning the Excel interface.

## Completion criterion

A successful capstone is not simply a lower RMS error. You should be able to explain which data constrain each parameter, why the parameter exists chemically, whether fitted phase equilibria are valid, how the model extrapolates, and whether subsystem quality survived the ternary fit.
