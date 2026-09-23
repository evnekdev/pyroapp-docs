# Common definitions

PyroApp, FactSage, ChemApp and ChemSage describe the same thermodynamic ideas with partly different terminology.

This page is a glossary for the terms used throughout the documentation.

For a connected explanation rather than a glossary, begin with [What a thermodynamic database contains](learn/thermodynamic-databases.md).

## System

A **system** is the chemical domain and set of thermodynamic phases considered in a calculation.

It is defined by:

- the selected thermodynamic data;
- the system components;
- the conditions;
- the set/status of phases allowed to participate.

Two calculations using the same datafile but different phase selections are not necessarily the same thermodynamic problem.

## System component

A **system component** is one independent coordinate used to express overall composition and mass balance.

Components are often chemical elements such as `Ca`, `Si`, `Fe`, or `O`.

Some models use additional formal components, for example electron pseudo-components associated with charge bookkeeping.

A component is not a phase.

A reported oxide basis such as CaO-SiO2 is also not automatically the same as the datafile's system-component basis. PyroApp can convert between chemically equivalent composition bases.

## Phase

A **phase** is one thermodynamic state that can participate in equilibrium.

PyroApp users most often encounter:

- **solution/mixture phases**, whose composition varies;
- **stoichiometric phases**, whose composition is fixed.

A formula can have more than one phase modification. Solid polymorphs, liquid and gas are distinct phases even when their overall chemical formula is the same.

## Solution / mixture phase

A **solution phase** is a variable-composition phase described by a mixing model.

FactSage commonly calls it a **solution**.

ChemSage/ChemApp terminology often uses **mixture phase** or simply phase.

Examples include metallic liquids, slags, spinels, solid solutions, gas mixtures, molten salts and aqueous phases.

## Stoichiometric compound / pure phase

A **stoichiometric compound** has fixed composition.

FactSage organizes these through compound databases.

ChemApp treats a stoichiometric phase as a trivial phase with a single constituent/pure-phase model.

This difference is organizational rather than a change in thermodynamics.

## Sublattice

A **sublattice** is a family of structurally or chemically equivalent sites in a solution model.

Different sublattices can have different species and different site amounts.

For example, a spinel-type model can distinguish tetrahedral and octahedral cation sites.

## Species

A **species** is an entity allowed to occupy a sublattice/site in the solution model.

In a one-sublattice model, species and constituent names can appear nearly identical.

In a multi-sublattice model they are distinct concepts.

## Endmember / phase constituent

An **endmember** is a limiting thermodynamic state defined by a valid combination of species across the sublattices.

FactSage commonly uses the word **endmember**.

ChemApp/ChemSage commonly exposes the corresponding object as a **phase constituent**.

An endmember can be a formal model state rather than a stable real compound.

Its standard-state Gibbs energy is still required by the model.

## Interaction

An **interaction** is a non-ideal contribution to the solution model.

Depending on the phase model, an interaction may be:

- binary;
- ternary;
- reciprocal;
- quasichemical;
- magnetic;
- another model-specific form.

Its identity includes the participating species/constituents and may also include sublattice grouping, powers and interaction family.

PyroApp returns exact interaction identities from the DAT file. Reference those values rather than rebuilding the strings manually.

## Standard state

A **standard-state thermodynamic function** defines the thermodynamic properties of a pure phase or solution constituent in its reference state.

Common database information includes reference enthalpy/entropy and heat-capacity expressions from which H(T), S(T) and G(T) can be obtained.

## Heat-capacity range

A **heat-capacity range** is a temperature interval over which one Cp expression is valid.

One phase can have several ranges.

A range change does not necessarily mean a phase transition; it can simply be a change of polynomial representation.

## Excess Gibbs energy

The **excess Gibbs energy** is the non-ideal part of a solution's mixing behavior beyond the chosen reference/configurational model.

Interaction parameters commonly contribute to this term.

## Condition

A **condition** constrains an equilibrium calculation.

Examples:

- temperature;
- pressure;
- incoming amount/composition;
- activity;
- chemical potential;
- phase amount;
- a target condition.

In `XLL_CA_CALCULATE`, one condition occupies one input column defined by the three-row header.

## Property / output

An **output property** is a value read from the calculated state.

Examples include:

- temperature;
- phase amount;
- activity;
- phase composition;
- Gibbs energy;
- enthalpy;
- heat capacity;
- error code.

## Target calculation

A **target calculation** asks the equilibrium solver to determine a variable that satisfies an additional thermodynamic condition.

For example:

> Find the temperature at which phase X forms at this composition and pressure.

PyroApp provides convenient `FORMATION` and `PRECIPITATION` target controls.

## Entered, dormant and eliminated phases

ChemApp phase-selection terminology:

- **entered** — allowed to participate normally in equilibrium;
- **dormant** — retained for metastable/target evaluation according to ChemApp semantics but not participating normally in mass balance;
- **eliminated** — excluded from the active equilibrium calculation.

PyroApp can define a base phase selection and can change phase status row-by-row.

## Three-row header

`XLL_CA_CALCULATE` uses three rows to identify each input/output column:

1. condition/property code and optional units;
2. phase name, if applicable;
3. constituent or system-component name, if applicable.

When row 2 or row 3 does not apply, enter the literal text `""`, with no leading equals sign.

Do not leave the metadata header cell physically blank.

## Terminology translation

| FactSage | ChemSage/ChemApp | PyroApp wording |
| --- | --- | --- |
| Solution | mixture/solution phase | solution phase |
| Compound | stoichiometric/pure phase | compound / stoichiometric phase |
| Endmember | phase constituent | constituent/endmember |
| Sublattice | sublattice | sublattice |
| Species | species | species |
| excess parameter | interaction parameter | interaction |

The mapping is conceptual. Exact model-specific semantics still come from the thermodynamic model.

## DAT

In PyroApp documentation, **DAT** normally means an open ChemSage/ChemApp calculation datafile.

Do not confuse this with the legacy FactSage `*SOLN.dat` solution-database format.

## CST

A **CST** is a protected ChemApp datafile.

It can be used for calculation when the licence permits, but its internal parameter contents are intentionally unavailable to PyroApp's open-DAT editing workflow.

## CDB

A **CDB** is a FactSage compound-database file family.

It is a binary master-database format containing compound/phase thermodynamic information.

## SLN and FDB

A modern FactSage solution database uses:

- **SLN** for the text solution/model definition;
- **FDB** for the binary thermodynamic function data referenced by solution endmembers.

These are database-development files, not the same as a ChemSage calculation DAT.
