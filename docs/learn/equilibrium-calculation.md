# How an equilibrium calculation works

PyroApp becomes much easier to use once you stop thinking of `XLL_CA_CALCULATE` as a mysterious Excel function and instead think of it as a compact description of an equilibrium problem.

The thermodynamic engine needs three things:

1. a model of the possible phases and their Gibbs energies;
2. enough independent conditions to define the state;
3. a rule about which phases are allowed to participate.

The datafile supplies the first. Your worksheet supplies the second and third.

## The thermodynamic problem

At equilibrium, the stable state is the state that satisfies the imposed constraints and minimizes the appropriate thermodynamic potential. For the common fixed-temperature, fixed-pressure problem, this is a Gibbs-energy minimization problem.

Conceptually:

```text
given:
    T
    P
    total composition
    possible phases
    thermodynamic models

find:
    phase assemblage
    phase amounts
    phase compositions

such that:
    mass balance is satisfied
    thermodynamic equilibrium conditions are satisfied
    total Gibbs energy is minimized
```

A thermodynamic database makes this possible by providing functions for the Gibbs energy of each possible phase over its valid range of temperature, pressure, and composition.

PyroApp does not change that thermodynamic problem. It changes how you describe it.

## System components are the composition coordinates

The calculation engine needs a set of independent components to express mass balance.

In many ChemSage/ChemApp datafiles the system components are chemical elements such as:

```text
Ca
Zn
Si
O
```

but this is not an absolute rule. Some models require additional formal components, for example electron pseudo-components associated with charged solution models.

The important point is that **system components are coordinates**, not phases.

A composition reported experimentally as:

```text
40 mass% CaO
60 mass% SiO2
```

is a convenient chemical basis. The calculation may nevertheless use Ca, Si, and O component amounts internally.

PyroApp's basis-conversion tools exist precisely to make this distinction explicit.

## Phases are possible thermodynamic states

The datafile contains a set of phases that may participate in equilibrium.

At the broadest level, there are two classes:

- **stoichiometric phases**, whose composition is fixed;
- **solution phases**, whose composition can vary.

A system may contain many possible phases even though only a few are stable for one composition and temperature.

The equilibrium calculation determines which of the allowed phases are stable.

This is why phase selection matters so much. If you remove a phase that should be stable, you are asking a different thermodynamic question.

## Entered, dormant and eliminated phases

ChemApp distinguishes phase statuses.

An **entered** phase is allowed to participate normally in equilibrium.

An **eliminated** phase is excluded from the calculation.

A **dormant** phase does not participate in the equilibrium mass balance in the normal way but can be evaluated for metastable or target purposes according to the ChemApp calculation semantics.

These controls are powerful because real research questions are often not simply "what is the globally stable equilibrium?"

You may want to calculate:

- a metastable liquid without allowing a stable solid to form;
- a liquidus involving only a chosen solid phase;
- the activity of a phase that is not part of the stable assemblage;
- an invariant equilibrium among a deliberately selected set of phases.

PyroApp therefore exposes phase selection explicitly rather than hiding it.

## A normal equilibrium calculation

The simplest useful problem fixes:

- temperature;
- pressure;
- incoming amounts of system components.

A PyroApp input table might conceptually look like:

| T | P | Ca | Zn | O |
| ---: | ---: | ---: | ---: | ---: |
| 1200 | 1 | ... | ... | ... |
| 1250 | 1 | ... | ... | ... |
| 1300 | 1 | ... | ... | ... |

The three-row PyroApp header tells the program what those numbers mean.

For example:

| header row | column 1 | column 2 | column 3 |
| --- | --- | --- | --- |
| code / unit | `T, [C]` | `P, [bar]` | `IA` |
| phase | `""` | `""` | `""` |
| constituent/component | `""` | `""` | `Ca` |

The literal `""` marker means that the corresponding phase or constituent field does not apply.

The `IA` condition means incoming amount. With no phase name and a component name in the third row, it refers to a system component.

The full table simply extends this pattern across however many components and other conditions are needed.

## Why the header has three rows

ChemApp properties can refer to different levels of the thermodynamic hierarchy.

Temperature is a system property, so it needs no phase name.

A phase amount refers to a phase.

A phase constituent activity refers to both a phase and a constituent.

An incoming amount may refer to a system component.

A three-row header gives one consistent way to describe all of these cases:

```text
row 1: property/condition code and units
row 2: phase, if applicable
row 3: constituent or system component, if applicable
```

This is much more flexible than having a separate Excel function for every possible thermodynamic quantity.

## What happens during one row

For one ordinary row, the calculation conceptually follows this sequence:

1. load the thermodynamic system;
2. restore the base phase selection;
3. apply the row's temperature, pressure, composition, and other conditions;
4. apply any row-specific entered/dormant/eliminated controls;
5. calculate equilibrium;
6. read the properties requested by the output header;
7. return those values to the output row.

The next row is then a new thermodynamic problem.

The workbook should therefore not depend on a hidden assumption that row 20 inherits the equilibrium state of row 19. Current PyroApp deliberately favors explicit, independent rows.

## Output properties

After equilibrium, the calculation state contains much more information than can conveniently be shown at once.

You choose what to return.

Typical outputs include:

- `T`, `P` — temperature and pressure;
- `A` — phase amount;
- `IA` — amount of a system component in a phase/system context;
- `AC` — activity;
- `MU` — chemical potential;
- `XP` — constituent mole fraction in a phase;
- `H`, `S`, `G`, `CP` — thermodynamic properties;
- `ERROR` — calculation error code;
- `NSTABLE` — a compact count of phases meeting PyroApp's stability-activity criterion.

This is one reason to design the output table before running hundreds of points. If a result is scientifically important for validating the calculation, request it explicitly.

## Target calculations

A phase diagram is often easier to describe as a target problem than as a dense scan.

Instead of asking:

> At 1200, 1201, 1202, ... °C, how much solid exists?

you can ask:

> At this bulk composition and pressure, at what temperature does this solid form?

That is a target calculation.

PyroApp includes convenient `FORMATION` and `PRECIPITATION` conditions for this purpose.

A target calculation changes the usual logic. One property becomes the unknown to solve for, commonly temperature, while another thermodynamic condition defines the target.

This makes it possible to calculate:

- liquidus/solidus points;
- phase-appearance temperatures;
- selected invariant equilibria;
- target activities or compositions where supported.

## Numerical success is not the same as physical success

This is one of the most important lessons from the legacy optimization tutorial.

A solver can return a number that does not represent the phase equilibrium you intended.

For example, if you are trying to calculate a three-phase invariant equilibrium, you should not accept a temperature merely because the target routine converged. You should also verify that all three participating phases are actually at the appropriate stability condition.

Useful checks include:

- `ERROR`;
- phase activities;
- `NSTABLE`;
- phase amounts;
- returned solution compositions;
- whether the expected phases were entered and competing phases were treated intentionally.

The old optimization workbooks used a "checksum" based on phase activities for exactly this reason.

## Why similar calculations belong in one table

The original PyroApp guide recommended organizing similar calculations together.

That remains good scientific practice even though the current execution architecture is different from the old Python implementation.

A table makes it easy to:

- see the complete calculation domain;
- check units and phase selection consistently;
- plot outputs;
- filter invalid rows;
- compare calculated and experimental values;
- pass a residual vector into an optimization workflow.

It also avoids hundreds of unrelated one-row formulas.

## PyroApp and Equilib describe the same kind of question differently

A useful exercise for a FactSage user is to take a familiar Equilib setup and identify its PyroApp representation.

Ask:

- What is fixed?
- What is allowed to vary?
- What is the composition basis?
- Which phases are entered?
- What property am I trying to obtain?
- Which outputs prove that the calculation is physically the one I intended?

The answers become the PyroApp input header, input row, phase-selection range, and output header.

Once you can perform that translation, most of PyroApp's calculation interface stops feeling unfamiliar.

Next, read [What a thermodynamic database contains](thermodynamic-databases.md) to understand where the Gibbs-energy functions and phase models come from.
