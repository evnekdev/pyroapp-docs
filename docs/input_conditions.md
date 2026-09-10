# Input conditions for XLL_CA_CALCULATE

Each input column is defined by three header cells: **code**, **phase**, and **constituent/component**. Use blank phase/constituent cells when a code is system-wide.

## Native thermodynamic conditions

| Code | Meaning | Typical scope | Target trigger? |
|---|---|---|---|
| `T` | Temperature | system | No |
| `P` | Pressure | system | No |
| `VT` | Total volume | system | No |
| `A` | Amount | phase/component/constituent as addressed | Yes |
| `IA` | Incoming amount | component/system addressing | No |
| `MU` | Chemical potential | component/constituent | No |
| `AC` | Activity / relative activity | phase/constituent | No |
| `CP` | Heat capacity target | addressed entity | Yes |
| `H` | Enthalpy target | addressed entity | Yes |
| `S` | Entropy target | addressed entity | Yes |
| `G` | Gibbs-energy target | addressed entity | Yes |
| `V` | Volume target | addressed entity | Yes |
| `AT` | Activity of a phase constituent as a target | phase + constituent | Yes |
| `XP` | Mole fraction of a system component in a phase as a target | phase + component | Yes |
| `XPT` | Target composition form supported by the ChemApp interface | phase + component/constituent as defined by the database | Yes |

The exact index domain matters. For example, `XP` resolves the third header row as a **system component** even when a phase is present.

## PyroApp calculation controls

| Code | Value | Effect |
|---|---|---|
| `FORMATION` | phase name | Solve a formation target for the named phase. |
| `PRECIPITATION` | phase name | Solve a precipitation target for the named phase. |
| `ENTERED` | phase name | Mark the named phase entered for this row. |
| `DORMANT` | phase name | Mark the named phase dormant for this row. |
| `ELIMINATED` | phase name | Mark the named phase eliminated for this row. |
| `TLOW` / `THIGH` | number | Lower / upper temperature search limit. |
| `PLOW` / `PHIGH` | number | Lower / upper pressure search limit. |
| `VLOW` / `VHIGH` | number | Lower / upper volume search limit. |
| `VARIABLE` | `T`, `P`, `V`, `IA`, or `IA0` | Select target variable; default is `T`. |
| `SHOWVAR` | TRUE/FALSE | Ask ChemApp to show its variable setup. Primarily diagnostic. |
| `SHOWCALC` | TRUE/FALSE | Use the verbose calculation-output variant. Primarily diagnostic. |
| `SKIP` | TRUE/FALSE | If TRUE, do not calculate the row; PyroApp returns the initialized output row. |

`USEFORNEXT` is intentionally not accepted by the current PyroApp 2 calculation planner because it creates an order-dependent continuation state.

## Units

Append a unit list to row 1, for example:

```text
T, [C]
P, [kPa]
```

See [System units](system_units.md). Each column is independent and cannot inherit a previous column's non-default unit.

## Blank values

Blank input cells generally mean “do not apply this condition for this row.” Boolean controls should be supplied as Excel TRUE/FALSE values or equivalent recognized text after normalization.

## Choosing conditions

ChemApp still enforces the physical degrees-of-freedom rules of an equilibrium problem. PyroApp makes the table interface convenient; it cannot make an over-constrained or under-specified thermodynamic problem valid.
