# ChemSage / ChemApp datafiles

PyroApp normally performs calculations from a **ChemSage/ChemApp datafile**.

This is the thermodynamic model as ChemApp sees it: a prepared description of the system components, phases, standard-state functions, solution models, and interaction parameters required for calculation.

For a new user, the most important fact is that this file is not the same thing as a complete FactSage database environment. It is a calculation-oriented representation of a selected thermodynamic system.

## Why the name "ChemSage/ChemApp"?

The format has historical roots in the ChemSage/ChemApp thermochemical ecosystem, so both names are encountered in documentation and research groups.

In PyroApp documentation, **ChemSage DAT** and **ChemApp DAT** refer to the same open-text calculation-file family.

This should not be confused with the old FactSage `*SOLN.dat` solution-database format. They share the `.DAT` extension but have different structures and purposes.

## What is inside a ChemSage datafile?

A ChemSage/ChemApp datafile contains enough information for the equilibrium engine to evaluate all selected phases.

Conceptually it contains:

- a list of system components;
- stoichiometric phases;
- solution phases;
- the thermodynamic model associated with each solution;
- phase constituents/endmembers;
- sublattice species where required by the model;
- standard-state thermodynamic functions;
- heat-capacity ranges;
- excess interaction parameters;
- magnetic or other model-specific terms where applicable;
- auxiliary model information needed by ChemApp.

Unlike FactSage's master database environment, these items are brought together into one calculation file.

That is why a DAT file can be moved with a workbook and still define the same thermodynamic system, assuming the ChemApp version/licence supports it.

## The component list comes first conceptually

The system components define the composition coordinates used by mass balance.

For many systems they are simply elements:

```text
Ca
Zn
Si
O
```

For charged solution models, the file may also contain formal electron/pseudo-components such as an `e(...)` component.

These are mathematical components of the model rather than additional chemical elements.

PyroApp therefore distinguishes between:

- the **number of system components**;
- the **number of actual chemical elements**.

For normal input composition, an elemental basis is usually the safest choice when the datafile uses elements as its independent components.

## Stoichiometric phases

A fixed-composition phase appears in the datafile with its composition and thermodynamic functions.

A compound can have several phase modifications, each of which is a separate thermodynamic phase for equilibrium purposes.

The data may include quantities such as:

- H298;
- S298;
- heat-capacity coefficients;
- temperature-range boundaries;
- transition information;
- auxiliary physical-property terms.

PyroApp exposes supported values from open DAT files through the `XLL_CA_GET_COMPOUND_*` family.

## Solution phases

A solution phase has variable composition and therefore requires a model.

Depending on the phase, the datafile can describe:

- one or more sublattices;
- species allowed on each sublattice;
- constituents/endmembers;
- standard-state functions for those constituents;
- excess interaction parameters;
- model-specific ordering or magnetic information.

The ordinary user does not need to understand the text record syntax. What matters is the thermodynamic hierarchy.

PyroApp lets you list the exact phase, constituent, species, and interaction names from the file.

## DAT is text, but it is not "just a text file"

An open DAT can be viewed in a text editor, which makes it tempting to edit values manually.

That is possible for an experienced database developer, but the format has structural relationships that should not be ignored.

Counts, phase definitions, constituent identities, interaction participants, parameter ordering, and model-specific sections must remain consistent.

PyroApp's supported SET functions therefore edit the data semantically rather than treating it as an arbitrary line of text.

The file is validated before a changed version replaces the original working path.

Even so, a thermodynamically bad but structurally valid parameter can still be written. Always keep a baseline copy.

## Open DAT files

The open `.DAT` format is the most useful form for teaching and optimization because the thermodynamic declarations are visible.

Current PyroApp supports open DAT workflows such as:

- list components;
- list phases;
- distinguish solution and compound phases;
- list constituents and species;
- list supported interaction families;
- read standard-state parameters;
- read heat-capacity ranges and coefficients;
- read interaction parameters;
- change supported parameters;
- calculate equilibria with ChemApp.

This gives the researcher both calculation access and parameter access.

## Protected CST files

A `.CST` file is a protected ChemApp data representation.

A CST may incorporate licence-holder restrictions, user identity restrictions, expiration rules, or other protection defined by the database provider and ChemApp environment.

Its internal model parameters are not available as open text.

PyroApp respects that boundary.

A protected CST can be used for `XLL_CA_CALCULATE` when the configured ChemApp runtime and licence permit it, but PyroApp's open-DAT parameter-inspection and parameter-editing functions do not decrypt or expose the protected contents.

This gives a simple practical distinction:

| Task | Open DAT | Protected CST |
| --- | --- | --- |
| equilibrium calculation | yes, when ChemApp supports it | yes, when licence permits |
| list/edit source parameters locally | yes | no |
| thermodynamic optimization by modifying model parameters | yes | no |

## BIN files

ChemApp can also work with binary calculation datafile forms in supported environments.

For a PyroApp user, BIN should be thought of as a **calculation input**, not as the open parameter-editing format.

The teaching and optimization workflows in this documentation focus on DAT because the model can be inspected.

## A DAT contains both compounds and solutions

This is one of the most important differences from FactSage's master database organization.

FactSage stores compound and solution database roles separately.

A ChemSage/ChemApp calculation file combines the selected compound and solution data needed by one thermodynamic system.

Conceptually:

```text
FactSage database pool
    compound data
    solution definitions
    endmember functions
        ↓ select/export
ChemSage DAT
    selected system components
    selected stoichiometric phases
    selected solution phases
    model data needed by ChemApp
```

This self-contained representation is convenient, but it should not be mistaken for a complete archival copy of every FactSage database-development field.

## Gas can look different from FactSage

A user moving from FactSage may notice that gas is organized differently.

Individual gaseous substances can be represented on the FactSage compound side, while the ChemApp calculation datafile presents gaseous species within an ideal-gas mixture phase.

This difference is about representation.

It does not mean the chemistry changed during export.

## Phase names are datafile identities

Use the phase names returned by the actual DAT file.

Do not assume that the name shown in a FactSage GUI is necessarily identical to the exported ChemApp name.

The export may introduce labels or multiple copies for purposes such as miscibility.

The same rule applies to constituents and interactions.

A good workbook first asks the file:

```excel
=XLL_CA_LIST_PHASES(datafile)
```

and then references those returned cells.

## Interaction identity can be complex

An interaction may encode more than "species A with species B."

Depending on the model, its identity can include:

- participants;
- sublattice grouping;
- explicit powers;
- interaction family;
- coefficient ordering.

PyroApp therefore displays interactions in a structured ChemApp-style notation and expects the exact returned identity for parameter access.

For a user, the practical rule is straightforward:

> List the interactions from the datafile and reference the returned string. Do not rebuild the interaction name manually.

## Why an optimization uses a working DAT

A thermodynamic optimization repeatedly changes parameters.

The safest project structure uses:

- a baseline DAT that never changes;
- a working DAT used by PyroApp SET functions;
- a record of the FactSage source from which the DAT was exported;
- the Excel workbook containing targets, residuals, and parameter tables.

Then one iteration can be understood as:

```text
parameter values in Excel
      ↓
write selected parameters to working DAT
      ↓
calculate equilibria from working DAT
      ↓
compare with experimental targets
      ↓
propose next parameter values
```

This is much easier to audit than modifying the only copy of a database.

## Relative paths make workbooks portable

If the DAT sits beside or below the workbook, a relative path can keep the project portable.

For example:

```text
project/
    assessment.xlsx
    data/
        working.dat
        baseline.dat
```

The workbook can reference:

```text
data\working.dat
```

rather than a machine-specific absolute path.

## Datafile changes and Excel recalculation

Excel tracks dependencies between cells. It does not automatically know that a file at the same path has different bytes after a parameter edit.

PyroApp therefore uses an optional **update token** in datafile-dependent formulas.

A practical optimization workbook makes the dependency explicit:

```text
parameter cells
     ↓
DAT SET formulas
     ↓
calculation token
     ↓
XLL_CA_CALCULATE
```

Changing the parameter state changes the token/dependency and triggers the calculation that uses the updated file.

## A ChemSage datafile is a model snapshot

The best mental model is:

> A DAT is a snapshot of the thermodynamic model prepared for a particular calculation scope.

It is more complete than a table of parameters but less complete than the entire database-development environment from which it may have been exported.

That is exactly what makes it useful for PyroApp.

For the relationship to the original FactSage databases, see [From FactSage to a ChemSage/ChemApp datafile](learn/factsage-to-chemsage.md).
