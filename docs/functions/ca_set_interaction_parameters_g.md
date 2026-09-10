# XLL_CA_SET_INTERACTION_PARAMETERS_G

**Availability:** stable for ordinary interaction terms exposed by the current DAT parser.

Changes one fixed thermodynamic term for each selected ordinary excess-Gibbs interaction.

## Syntax

```excel
=XLL_CA_SET_INTERACTION_PARAMETERS_G(datafile,phases,interactions,value_indices,values,[update_token])
```

`phases`, `interactions`, `value_indices`, and `values` correspond by position.

| Value index | Term |
|---:|---|
| `1` | constant |
| `2` | linear in T |
| `3` | T·ln(T) |
| `4` | T² |
| `5` | T³ |
| `6` | 1/T |

Use `XLL_CA_LIST_INTERACTIONS_G` to obtain exact interaction descriptions.

!!! important
    Interaction identity comes from `chemsage-parser`, not `TQLPAR` display text, so powers above 9 remain unambiguous.

The DAT is atomically updated at the supplied path.