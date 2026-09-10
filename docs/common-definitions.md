# Common definitions

These terms appear throughout PyroApp, ChemApp and thermodynamic databases.

## System and system components

A **system** is the chemical domain described by a datafile and the conditions of a calculation. A **system component** is one coordinate of the system composition. Components are often elements, but a database may use compound-like formula units such as `CaO`, `SiO2`, or other independent composition coordinates.

## Phase

A **phase** is a thermodynamic state that can participate in equilibrium. PyroApp distinguishes two broad classes:

- **solution (mixture) phase** — composition can vary;
- **stoichiometric compound** — fixed overall composition.

## Phase constituent / endmember

A **phase constituent** is a constituent state used to describe a solution phase. In many engineering models these are called **endmembers**. Constituents have standard-state thermodynamic data and a stoichiometry in the system-component basis.

A stoichiometric compound behaves as its own fixed-composition phase rather than a variable-composition solution.

## Sublattice and species

Many solution models divide a phase into one or more **sublattices**. A **species** occupies a sublattice. A constituent can represent a valid combination of species across those sublattices. In a one-sublattice model, species and constituent names may coincide.

## Interaction

An **interaction** is a non-ideal model term involving selected species or constituents. Different phase models encode binary, ternary, reciprocal, magnetic and other interactions differently.

PyroApp exposes stable interaction descriptions for selection in GET/SET functions. These descriptions are derived from the DAT model, including multi-digit powers.

## Condition

A **condition** constrains an equilibrium calculation: temperature, pressure, incoming composition, phase amount/activity, target property, and so on. In `XLL_CA_CALCULATE`, each condition occupies one input column defined by a three-row header.

## Property / output

An **output property** is a value read after equilibrium: temperature, phase amount, composition, activity, enthalpy, Gibbs energy, number of stable phases, an error code, etc.

## Three-row header convention

`XLL_CA_CALCULATE` input and output headers always contain three rows: code, phase, and constituent/component. When the phase or constituent/component field does not apply, the documented default is the **empty string** `""`, never a genuinely empty cell. For manually authored cells, `=""` is a convenient way to produce this value.

This convention is deliberate: a header with no physically empty cells behaves as one contiguous Excel table and is easier to select, copy, resize, filter, and manipulate reliably.

This rule applies to the phase and constituent/component **header rows**. It does not change the separate meaning of missing values in calculation-data rows, where a blank data cell can mean that a condition is not applied for that calculation point.

## Entered, dormant and eliminated phases

ChemApp phase selection controls whether a phase is available to the equilibrium solver:

- **entered** — available normally;
- **dormant** — available for metastable/target behaviour according to ChemApp semantics;
- **eliminated** — excluded from the active equilibrium calculation.

PyroApp can set a base selection using the optional `entered` table and can change selection row-by-row with `ENTERED`, `DORMANT` and `ELIMINATED` input controls.
