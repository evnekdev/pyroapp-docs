# Output properties for XLL_CA_CALCULATE

Output columns use the same three-row header format as inputs: property code, phase, and constituent/component. When the phase or constituent/component field does not apply, write `=""`; do not leave the corresponding header cell genuinely blank. The formula evaluates to the required runtime empty string `""`.

This keeps the complete output header contiguous and easy to select, copy, resize, filter, and manipulate as a table.

## Thermodynamic outputs

| Code | Meaning | Common scope |
|---|---|---|
| `T` | Temperature | system |
| `P` | Pressure | system |
| `VT` | Total volume | system |
| `A` | Equilibrium amount | phase/component/constituent |
| `IA` | Incoming amount | component/system |
| `MU` | Chemical potential | component/constituent |
| `AC` | Activity / fugacity-like activity value | phase/constituent |
| `pH` | pH | system where meaningful |
| `Eh` | redox potential output | system where meaningful |
| `CP` | Heat capacity | selected scope |
| `H` | Enthalpy | selected scope |
| `S` | Entropy | selected scope |
| `G` | Gibbs energy | selected scope |
| `V` | Volume | selected scope |
| `CPM` | Molar/specific heat-capacity form using the selected amount basis | selected phase/system |
| `HM` | Molar/specific enthalpy form | selected phase/system |
| `SM` | Molar/specific entropy form | selected phase/system |
| `GM` | Molar/specific Gibbs-energy form | selected phase/system |
| `VM` | Molar/specific volume form | selected phase/system |
| `X` | Fraction/composition result in the addressed domain | component/constituent |
| `XP` | System-component fraction in a phase | phase + system component |
| `AP` | Phase-related amount/property form exposed by ChemApp | phase |

For `XP`, the third header row is a **system component**, not a phase constituent.

## PyroApp diagnostic outputs

| Code | Meaning |
|---|---|
| `ERROR` | Native ChemApp error code associated with this row. Successful row = `0`. |
| `NSTABLE` | Number of phases with activity strictly greater than `0.9999`. |
| `BOND` | Model-specific bond/sublattice query. Requires the phase and the documented species-pair expression. |
| `TIME_THREAD` | Elapsed calculation timing diagnostic for the row. |
| `TIME_SYSTEM` | Elapsed timing diagnostic using the current monotonic implementation. |

Timing columns are useful for profiling but should not be used as scientific outputs or compared for numerical parity between machines.

## Units

Output headers can request supported unit overrides using `CODE, [unit]`. See [System units](system_units.md).

## Missing point results

A native failure that PyroApp classifies as a recoverable point error can produce `NaN` for properties that cannot be retrieved while allowing subsequent rows to run. Include `ERROR` when debugging a table with failed points.
