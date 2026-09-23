# Tutorial: convert composition bases

Experimental compositions are often reported in a convenient oxide or compound basis, while equilibrium input is most robust in the datafile's system-component basis.

The legacy example 01 taught this operation.

## Function

```excel
=XLL_DATA_CHANGE_BASIS(basis_initial,basis_final,data_initial,isweight_initial,isweight_final,is_fraction)
```

## Example: oxide basis to system components

Suppose `B4:C4` contains:

```text
CaO | ZnO
```

and `E4:G4` contains the system components:

```text
Ca | Zn | O
```

Put experimental compositions in `B7:C26`, then enter in `E7`:

```excel
=XLL_DATA_CHANGE_BASIS($B$4:$C$4,$E$4:$G$4,B7:C26,FALSE,FALSE,FALSE)
```

The result spills as Ca-Zn-O component amounts.

## Boolean arguments

| Argument | Meaning |
| --- | --- |
| `isweight_initial` | TRUE for weight input, FALSE for molar input |
| `isweight_final` | TRUE for weight output, FALSE for molar output |
| `is_fraction` | TRUE to normalize each output row |

A good workbook keeps the reported composition, the human-readable basis, and the system-component amounts in visibly separate blocks.

## Checks

- Converted values should not contain meaningful negative amounts.
- If `is_fraction=TRUE`, valid output rows should sum to approximately 1.
- The final basis should agree with `XLL_CA_LIST_COMPONENTS`.

## Next

Use the converted values in [First equilibrium table](first-equilibrium.md) or [Temperature and composition sweeps](equilibrium-sweep.md).
