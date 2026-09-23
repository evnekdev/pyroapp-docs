# Solve and apply one linear parameter update

With residual vector `r` and derivative matrix `A`, PyroApp can solve a weighted least-squares step.

## Convention

```text
r = target - current
A = d(current) / d(parameter)
A Δp ≈ r
```

The solved vector is therefore interpreted as a proposed parameter change `Δp`.

## Worksheet example

Assume:

- `J10:M20` = derivative matrix;
- `F10:F20` = residuals;
- `G10:G20` = non-negative weights;
- `J7:M7` = TRUE/FALSE free mask;
- `J8:M8` = fixed values of the solved vector.

For the normal derivative workflow, fixed parameters usually have fixed value 0.

```excel
=XLL_LINEAR_REGRESSION(J10:M20,F10:F20,G10:G20,J7:M7,J8:M8)
```

The result spills horizontally.

Free entries are least-squares values of `Δp`; non-free entries retain the corresponding `fixed_values`.

## Predict before applying

```text
predicted = current + A Δp
predicted residual = residual - A Δp
```

Use the predicted residuals to judge whether the local linear model suggests an improvement.

## Damping

Do not automatically apply a large full step.

```text
parameter_new = parameter_current + α Δp
```

with `0 < α <= 1`.

A smaller `α` is often useful when phase topology or solution behavior changes nonlinearly.

## Safe first workflow

1. keep regression output in a separate proposed-step row;
2. inspect sign and magnitude;
3. choose damping;
4. apply new values to numeric parameter cells;
5. change the trigger once;
6. let SET formulas update the working DAT;
7. recalculate the real thermodynamic model;
8. compare real residuals with predicted residuals.

Do not create a circular formula that automatically overwrites the parameter cells used to generate its own Jacobian.

## If the real fit gets worse

Consider:

- step too large for local linearization;
- poor derivative step;
- phase-topology change;
- strongly correlated parameters;
- inappropriate target mask/weight;
- missing model degree of freedom.

Reduce the step or reconsider the model rather than repeatedly forcing regression.

## Next

[Select a parameter combination](parameter-selection.md).
