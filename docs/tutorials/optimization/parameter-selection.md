# Select a small parameter combination

Adding every possible interaction parameter usually makes a model harder to interpret and can create severe correlation.

`XLL_BEST_COMBINATION` compares small candidate combinations under the same linearized objective.

## Syntax

```excel
=XLL_BEST_COMBINATION(derivatives,residuals,weight,free,fixed_values,nparams)
```

The output is a **0/1 mask**, one entry per derivative column:

- 1 = selected;
- 0 = not selected.

Only parameters whose input `free` value is TRUE are candidates.

## Example

For six candidate parameters, ask for the best pair:

```excel
=XLL_BEST_COMBINATION(J10:O30,F10:F30,G10:G30,J7:O7,J8:O8,2)
```

An output:

```text
0  1  0  0  1  0
```

means columns 2 and 5 form the selected two-parameter combination for the current Jacobian and weighted residuals.

## Use it as a research aid

The search is combinatorial, so keep the candidate set deliberately limited.

Before accepting a selected parameter ask:

- What chemical interaction does it represent?
- Is its sign/magnitude plausible?
- Is the feature already represented elsewhere?
- Does it improve data not used to choose it?
- Does it damage a subsystem while improving a larger system?

## Recommended sequence

1. optimize a simpler parameter set;
2. inspect systematic residual structure;
3. propose a few chemically meaningful parameters;
4. calculate their derivative columns;
5. compare 1- or 2-parameter subsets;
6. fit the chosen subset;
7. recalculate the nonlinear model;
8. validate phase topology and extrapolation.

## Next

[Ca-Zn-Si-O capstone](ca-zn-si-o.md).
