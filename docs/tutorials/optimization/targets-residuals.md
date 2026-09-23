# Targets, residuals and weights

The quality of an optimization is dominated by the quality of its target table.

## What is a target?

A target is an experimentally supported property the model should reproduce.

Common examples:

- liquidus or solidus temperature;
- invariant temperature;
- composition of a solution phase;
- solubility limit;
- activity or chemical potential;
- Gibbs energy, enthalpy or entropy of mixing.

## Recommended normalized table

| Column | Purpose |
| --- | --- |
| ID | Human-readable target identifier |
| System | Subsystem/category |
| Target | Experimental/reference value |
| Current | Value calculated from current DAT |
| Residual | `Target - Current` |
| Weight | Relative regression importance |
| Valid | TRUE only when calculation is trustworthy |
| ERROR | ChemApp error code where applicable |

For phase equilibria, also preserve enough phase-stability information to prove that the intended assemblage was calculated.

## Residual sign

Use:

```text
residual = target - current
```

If:

```text
A = d(current) / d(parameter)
```

then:

```text
A Δp ≈ residual
```

This is the convention used in the linear-regression tutorial.

## Invalid points

Do not pass a failed equilibrium into regression as a huge numeric residual.

Deactivate a row if, for example:

- `ERROR <> 0`;
- expected phases are not stable;
- an invariant has the wrong number of stable phases;
- requested solution composition is unavailable;
- the result is non-finite.

Keep the row visible but set its optimization mask FALSE.

## Weights

Weights should express scientific judgment.

Start with transparent values such as 1. Change them only for a stated reason, for example differing experimental reliability or unit scaling.

Repeated measurements should not automatically overwhelm an independent target simply because there are more rows.

## Target, current and predicted

Keep three concepts separate:

- **target**: experimental/reference value;
- **current**: real nonlinear calculation from current DAT;
- **predicted**: `current + A Δp`.

Predicted values are useful for judging a proposed step, but after applying the step you must recalculate the real thermodynamic model.

## Error summary

For category-labelled phase-diagram residuals:

```excel
=XLL_PD_ERROR_TABLE(categories,initial_residuals,predicted_residuals,mask,dTdx)
```

This returns grouped count/error statistics plus a total row.

## Next

[Calculate the derivative matrix](derivative-matrix.md).
