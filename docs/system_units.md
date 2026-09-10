# System units

`XLL_CA_CALCULATE` accepts optional unit declarations in the first row of an input or output header. Use this form:

```text
CODE, [unit]
```

Examples:

```text
T, [C]
P, [kPa]
H, [kJ is not supported]
```

Only the units listed below are accepted. Each column is interpreted independently; omitting a unit restores that family's documented default rather than inheriting the preceding column's setting.

| Quantity | Default | Accepted units |
|---|---|---|
| Temperature | `K` | `K`, `C`, `F` |
| Pressure | `bar` | `bar`, `atm`, `Pa`, `kPa`, `psi`, `torr` |
| Amount | `mol` | `mol`, `gram`, `kg`, `tonne`, `pound` |
| Energy | `J` | `J`, `cal`, `Btu`, `kWh` |
| Volume | `dm3` | `dm3`, `cm3`, `m3`, `ft3`, `in3` |

Multiple unit families can be associated with a property where ChemApp requires them. Write the units inside the bracket list separated by commas.

!!! tip
    Use defaults while learning PyroApp. Add explicit units only where a workbook needs a different engineering convention, such as `T, [C]`.

!!! warning
    Unit spellings are part of the calculation interface. Do not assume arbitrary SI prefixes are accepted. For example, use one of the pressure units in the table rather than inventing `MPa` unless the current function documentation explicitly adds it.
