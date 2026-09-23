# Phase models

A thermodynamic database must describe how the Gibbs energy of every possible phase changes with temperature, pressure, and composition.

For a stoichiometric compound, composition is fixed.

For a solution phase, composition varies, so a mathematical **solution model** is required.

An ordinary PyroApp user does not choose the model in the Excel formula. The model is already part of the datafile.

Understanding the broad model families is nevertheless very useful when reading a database, choosing optimization parameters, or interpreting strange extrapolation.

## Why one model does not fit every phase

Different phases have different physical structures.

An ideal gas mixture behaves very differently from a metallic liquid, an ionic oxide slag, a spinel solid solution, or an aqueous electrolyte.

A useful model should reflect the important degrees of freedom of the phase without introducing unnecessary parameters.

This is why thermodynamic databases contain several solution-model families rather than one universal polynomial.

## The simplest picture: ideal mixing plus excess energy

A simple substitutional solution can be understood as:

```text
G = standard-state contribution
  + ideal/configurational mixing
  + excess Gibbs energy
```

The standard-state term says what the limiting constituents cost energetically.

The ideal/configurational term represents the entropy associated with mixing.

The excess term corrects the model for real non-ideal interactions.

In a relatively simple one-sublattice phase, the excess term may be represented by polynomial interaction parameters such as Redlich-Kister/Muggianu-type expressions.

This picture is useful even for more complicated models, although the definitions of "constituent," "configuration," and "interaction" become richer.

## Sublattice models

Many crystalline phases have chemically distinct sites.

A sublattice model assigns different sets of species to different site families.

For example:

```text
(A, B, C)_1 (D, E, Va)_2
```

can represent two kinds of site, each with its own allowed occupants.

A specific combination across the sublattices corresponds to an endmember/phase constituent.

The **Compound Energy Formalism** is an important family built around this idea.

Its power is that it can represent ordering, substitution, vacancies, and coupled composition changes in a thermodynamically systematic way.

The price is a larger number of formal endmembers and interaction terms.

## Endmembers are model states, not necessarily real compounds

A beginner often assumes that every endmember must be an experimentally isolable compound.

That is not true.

In a charged sublattice model, a formal endmember can carry charge or represent a limiting site configuration that exists only as part of the mathematical construction.

Its Gibbs energy may be derived from combinations of real compound functions plus model parameters.

Therefore, when optimizing an endmember term, ask what physical relationship the term is enforcing rather than whether the endmember name looks like a real bottleable substance.

## Quasichemical and short-range-ordering models

Some liquid and solid solutions exhibit strong local ordering that is poorly represented by a simple random-mixing model.

Modified quasichemical and related models introduce pair, bond, or other local-configuration descriptions so that short-range ordering contributes explicitly to the Gibbs energy.

These models are important in systems such as oxide slags, where local chemical association and cation/anion structure matter.

Their interaction parameters should not be interpreted exactly like ordinary Redlich-Kister coefficients.

The parameter identities may include species on different sublattices, pair/quadruplet information, powers, and model-family labels.

## Magnetic contributions

Some solution phases require magnetic contributions.

The magnetic part of the thermodynamic description can introduce parameters such as characteristic temperatures and magnetic moments/order parameters in addition to the ordinary Gibbs-energy interactions.

PyroApp treats magnetic interaction parameters as a distinct family because they are thermodynamically different from ordinary excess-Gibbs coefficients.

For optimization, keep that distinction visible.

## Ionic and aqueous models

Ionic liquids and aqueous phases require additional treatment of charge and electrostatic behavior.

Their system-component and species lists can therefore contain identities that look unusual compared with a neutral metallic alloy.

Formal electron components, charged species, and model-specific constraints are normal in such systems.

Do not simplify these identities merely because the worksheet would look cleaner.

## Common model names you may encounter

ChemSage/ChemApp datafiles use model-family names. FactSage uses its own internal model identities, but the underlying scientific families correspond.

Examples that appear in the FactSage/ChemSage ecosystem include:

| Broad family | Typical use / idea |
| --- | --- |
| ideal-mixing model | ideal gas and other idealized mixtures |
| one-lattice polynomial / Redlich-Kister-Muggianu | substitutional solutions with polynomial excess terms |
| Compound Energy Formalism / sublattice model | ordered or multi-site solid/liquid solutions |
| modified quasichemical models | strong short-range ordering, often in oxide/ionic melts |
| ionic-liquid sublattice models | charged liquid structures |
| unified interaction/Wagner-type models | dilute/interacting solution descriptions |
| Pitzer-type models | electrolyte/aqueous behavior |
| magnetic extensions | magnetic contributions combined with another base model |

The exact syntax, equations, and parameter meanings are model-specific.

Do not infer the equation solely from a familiar-looking interaction label.

## FactSage and ChemSage names are not always identical

The same scientific model can have different internal or display names in FactSage and ChemSage.

This is another reason PyroApp does not ask the Excel user to choose a model code.

The datafile already contains the translated model definition.

For normal calculation, this is sufficient.

For database-development work, consult the model documentation and the original FactSage database rather than treating the exported ChemSage label as the only description of the phase.

## What PyroApp exposes

For an open DAT, PyroApp can expose the practical model objects needed by a researcher:

- solution phases;
- constituents/endmembers;
- species;
- ordinary interactions;
- magnetic interactions;
- selected standard-state parameters.

The workbook therefore sees the model at a semantic level.

You normally do not need to interpret fixed columns or raw text blocks.

## What ChemApp evaluates

`XLL_CA_CALCULATE` does not reimplement the model equations in Excel.

ChemApp loads the complete datafile and evaluates the model during equilibrium calculation.

This division is scientifically useful:

- PyroApp helps you select, display, edit, and organize model parameters;
- ChemApp remains responsible for the actual thermodynamic evaluation and Gibbs-energy minimization.

## Why model literacy matters for optimization

A least-squares routine only sees numbers.

It does not know that one parameter is a physically meaningful binary interaction while another is a formal endmember correction needed to preserve a crystal-structure relationship.

It also does not know whether two parameters are nearly redundant.

Before freeing a parameter, ask:

- Which phase does it belong to?
- Which species/endmembers does it involve?
- Which experimental data actually constrain it?
- Is the term binary, ternary, reciprocal, magnetic, or model-specific?
- Does a lower-order subsystem already determine it?
- Will changing it damage a well-established binary description?
- Is its magnitude physically plausible?

This is the core reason the legacy PyroApp optimization guide taught solution-model structure before teaching automated regression.

## A recommended learning order

If you only want equilibrium calculations:

1. learn phase names;
2. learn system components;
3. learn constituents only when an output needs them;
4. let the datafile carry the model details.

If you want to optimize a database:

1. identify the solution model;
2. understand sublattices/species/endmembers;
3. identify which parameters are physically adjustable;
4. connect each parameter to experimental targets;
5. only then build a derivative matrix.

The [Simple optimization tutorial](tutorials/optimization/index.md) follows this order.
