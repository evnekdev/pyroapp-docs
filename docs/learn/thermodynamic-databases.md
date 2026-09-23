# What a thermodynamic database contains

A thermodynamic database is not simply a table of reaction constants and it is not a catalogue of experimentally measured phase boundaries.

It is a mathematical description of the Gibbs energies of the phases that may exist in a chemical system.

Once those Gibbs-energy functions are defined, an equilibrium program can determine which combination of phases minimizes the total Gibbs energy while satisfying mass balance and the other imposed conditions.

That distinction is fundamental to understanding FactSage, ChemApp and PyroApp.

## From experimental information to a model

Experimental thermodynamic assessment usually starts with information such as:

- phase-transition temperatures;
- phase-boundary compositions;
- invariant equilibria;
- activities and chemical potentials;
- calorimetric enthalpies;
- heat capacities;
- Gibbs energies of mixing;
- enthalpies of mixing;
- solubility limits;
- crystallographic information.

Those measurements do not usually enter an equilibrium calculation directly.

A database developer interprets them through thermodynamic models and adjusts model parameters so that the model reproduces the available evidence as well as possible.

The resulting database contains functions and parameters.

The equilibrium engine then uses those functions to predict conditions that may never have been measured explicitly.

## The two broad classes of phases

For introductory purposes, it is useful to divide phases into two classes.

### Stoichiometric phases

A stoichiometric phase has a fixed composition.

Examples might include a pure element, a line compound, or a particular crystal modification of a compound.

Its Gibbs energy can be described as a function of variables such as temperature and pressure without needing an internal composition coordinate.

A single chemical formula may have more than one phase modification. For example, a compound may have several solid polymorphs and a liquid phase. These are thermodynamically distinct phases even if they share the same overall formula.

### Solution phases

A solution phase has variable composition.

Examples include:

- liquid metallic alloys;
- oxide slags;
- solid solutions;
- molten salts;
- spinels;
- gas mixtures;
- aqueous solutions.

A solution phase therefore needs more than a standard-state Gibbs-energy function. It also needs a model for how Gibbs energy changes as composition changes.

## A useful Gibbs-energy picture

A simplified way to think about a solution model is:

```text
G(solution)
    =
standard-state contribution
    +
configurational / ideal-mixing contribution
    +
excess non-ideal contribution
    +
other model-specific terms
```

The exact equation depends on the solution model.

Some phases can be described by relatively simple polynomial excess terms. Others require several sublattices, charge balance, short-range ordering, magnetic terms, reciprocal interactions, or other model-specific structures.

The important point for a PyroApp user is that these equations are already encoded in the datafile. You normally select the **phase** and its conditions; you do not rewrite the solution-model equation in Excel.

## Standard-state functions

Every stoichiometric phase and every solution constituent/endmember needs a standard-state thermodynamic description.

A common representation contains quantities such as:

- enthalpy at a reference temperature;
- entropy at a reference temperature;
- heat-capacity expressions over one or more temperature ranges;
- transition data where a phase undergoes a structural change;
- additional pressure, magnetic, or other terms where the model requires them.

Heat capacity is particularly important because it allows the reference enthalpy and entropy to be propagated to other temperatures.

Conceptually:

```text
Cp(T)
   ↓ integrate
H(T), S(T)
   ↓
G(T) = H(T) - T S(T)
```

The real database representation can contain several temperature ranges and model-specific additions, but this is the thermodynamic idea behind it.

## Solution phases, sublattices and species

Many important solution models are built around crystallographic or chemically distinct sites.

Consider a spinel-like solid solution.

There may be one set of tetrahedral sites and another set of octahedral sites. Different cations prefer different sites and may substitute for one another.

A database can represent this by defining separate **sublattices**.

The chemical entities allowed on a sublattice are called **species**.

A schematic phase might be written as:

```text
(A, B, C)_tetrahedral (D, E, F, Va)_octahedral
```

where `Va` denotes a vacancy species.

The full thermodynamic model then describes how the site occupancies contribute to the Gibbs energy.

Liquid phases can also be represented with sublattices. Sublattices are not limited to crystalline solids.

## Endmembers and phase constituents

A specific allowed combination of species across the sublattices defines a limiting configuration commonly called an **endmember** in FactSage terminology.

ChemApp/ChemSage commonly exposes the corresponding object as a **phase constituent**.

For a simple one-sublattice solution, constituent and species identities may look nearly identical.

For a multi-sublattice phase, they are conceptually different.

An endmember does not have to correspond to a material that can be isolated experimentally. In charged multi-sublattice models, some endmembers are formal thermodynamic states that are useful for constructing the model but would not exist as neutral pure compounds.

This is why a thermodynamic database should not be interpreted as a simple list of real chemical substances.

## Where endmember Gibbs energies come from

Some endmembers correspond closely to real pure compounds. Their standard-state functions can therefore be related to measured compound properties.

Other endmembers are unstable or purely formal.

Their Gibbs energies may be constructed from combinations of known compound functions plus additional energetic terms.

The legacy Ca-Zn-Si-O optimization guide illustrates this idea explicitly: a solution database may reference a Gibbs-energy function such as a liquid or solid form of a compound, while unstable endmembers require added energetic contributions to place them appropriately relative to the real stable structures.

This is part of **model construction**, not equilibrium calculation.

Once the model has been built and exported, ChemApp simply evaluates the model supplied in the datafile.

## Interactions describe non-ideal mixing

If the Gibbs energy of a solution were completely described by endmember energies and ideal configurational entropy, every solution would behave ideally.

Real solutions do not.

Database developers therefore introduce **interaction parameters** to describe the excess Gibbs energy.

Depending on the model, these may involve:

- two species;
- three species;
- species on different sublattices;
- reciprocal combinations;
- magnetic interactions;
- short-range-ordering terms.

The coefficients can depend on temperature and sometimes other variables.

A parameter name is therefore not merely a label. Its participating species, sublattice positions, powers, interaction family and coefficient order are part of its thermodynamic identity.

For optimization work, this matters enormously. Changing "an interaction" without knowing which model term it represents can improve a numerical fit while destroying the physical meaning of the model.

## Binary and ternary do not always mean the same thing as binary and ternary systems

A **binary interaction** normally means an interaction term involving two selected species or constituents.

That does not necessarily mean the overall database contains only two chemical elements.

Likewise, a ternary interaction term may appear inside a multicomponent phase.

It is useful to distinguish:

- the dimensionality of the chemical **system**;
- the number of species involved in one **interaction term**.

These are different ideas.

## System components and chemical elements

A ChemApp calculation expresses overall mass balance using **system components**.

They are often chemical elements, which is why elemental input is usually the most robust composition basis.

However, formal components can also appear. Charged solution models may introduce electron-like pseudo-components for maintaining the mathematical bookkeeping of charge.

This explains why a datafile may have, for example, four real chemical elements but more than four listed system components.

Do not infer the number of chemical elements solely from the number of component labels.

## A database is a graph of relationships

For a user, it is often more helpful to imagine the data as a hierarchy than as a file.

```text
thermodynamic database / datafile
│
├── system components
│
├── stoichiometric phases
│   ├── composition
│   ├── standard-state functions
│   └── transitions / auxiliary properties
│
└── solution phases
    ├── solution model
    ├── sublattices
    │   └── species
    ├── endmembers / phase constituents
    │   └── standard-state functions
    └── interactions
        ├── participants
        ├── powers / topology
        └── parameter coefficients
```

FactSage and ChemSage store this graph differently, but the underlying thermodynamic concepts are closely related.

## Why the names change between FactSage and ChemApp

FactSage and ChemApp grew from related but different user interfaces and file formats.

As a result, the same scientific concept can have a different name.

A useful translation is:

| FactSage term | ChemSage/ChemApp term | Meaning |
| --- | --- | --- |
| Solution | Mixture/solution phase | variable-composition phase |
| Compound | Stoichiometric/pure phase | fixed-composition phase |
| Endmember | Phase constituent | limiting state used by the solution model |
| Sublattice | Sublattice | site family in a multisite model |
| Species | Species | entity occupying a sublattice/site |

This mapping is conceptually useful, but individual models still have special rules.

### A note about gas

The representation of gas is a good example of why file-format terminology can be surprising.

In FactSage, gaseous chemical species are associated with compound data. In a ChemApp datafile, those species can appear together as an ideal-gas solution phase.

The thermodynamic meaning has not suddenly changed. The two systems organize the same physical information differently.

## The database already chooses the solution model

A normal PyroApp user does not choose "Redlich-Kister" or "Compound Energy Formalism" as an argument to `XLL_CA_CALCULATE`.

The phase model is part of the datafile.

When ChemApp loads the file, it knows how the phase is represented and evaluates the corresponding Gibbs-energy expression.

You need detailed model knowledge mainly when:

- editing model parameters;
- deciding which interactions to optimize;
- diagnosing unexpected extrapolation;
- adding new components or endmembers;
- constructing a database from scratch.

For routine equilibrium calculation, exact phase names, constituent names, composition basis, and phase selection are usually more important.

## Thermodynamic optimization changes the model, not the equilibrium law

In an optimization project, the Gibbs-energy minimization method does not change.

What changes are the parameters inside the phase models.

For a trial parameter set:

1. calculate the same experimental conditions;
2. compare model predictions with target data;
3. calculate residuals;
4. estimate how the residuals respond to parameter changes;
5. propose a new parameter set;
6. recalculate the full nonlinear thermodynamic model.

A lower residual is useful evidence, but it is not the only objective.

A good assessment must also preserve:

- physically sensible phase topology;
- plausible interaction parameters;
- correct subsystem behavior;
- acceptable extrapolation;
- consistency with thermochemical data that were not directly fitted.

This is why understanding the hierarchy above is more important than simply knowing how to press an optimization button.

Next, [FactSage database formats](factsage-databases.md) explains how these thermodynamic objects are divided among old and modern FactSage files.
