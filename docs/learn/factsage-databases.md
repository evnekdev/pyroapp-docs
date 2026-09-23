# FactSage database formats: compounds, old solutions and modern solutions

FactSage users often speak about "a database" as if it were one file. Internally, the picture is more structured.

The most important distinction is between:

- **compound data**, describing stoichiometric substances/phases and their standard-state properties;
- **solution data**, describing variable-composition phases, their internal constituents, and their interaction models.

The exact file representation has also changed over the history of FactSage.

Understanding these distinctions is especially useful when moving between FactSage and PyroApp, because a ChemSage/ChemApp datafile combines information that FactSage stores in several places.

## FactSage database pool versus one calculation datafile

FactSage can work with a pool of databases.

A calculation may use selected compounds from one source and selected solution phases from another. The graphical interface helps manage this larger database environment.

ChemApp works differently. It normally loads one prepared calculation datafile containing the system components and phases needed for a particular calculation scope.

That is why exporting from FactSage to ChemSage should be thought of as creating a **calculation projection** of the master database environment.

## Compound databases: CDB

FactSage compound databases conventionally use the `.CDB` extension.

The Compound module presents them as chemical compounds and phases, but the physical file is binary rather than a human-readable text document.

Conceptually, a compound database contains:

- a compound identity and formula;
- one or more thermodynamic phases associated with that compound;
- standard-state enthalpy and entropy information;
- heat-capacity expressions over temperature ranges;
- phase-transition information where applicable;
- comments and auxiliary physical-property records.

A single formula can have several phase records.

For example, a substance can have:

- more than one solid modification;
- a liquid;
- a gas;
- an aqueous form.

Those phase records are distinct thermodynamic states even though they belong to the same chemical formula.

### Heat-capacity ranges

A phase can be represented by several heat-capacity ranges because one polynomial expression may not describe the full temperature interval adequately.

A typical conceptual record therefore looks like:

```text
compound
    phase 1
        H298
        S298
        Cp range 1
        Cp range 2
        ...
    phase 2
        ...
```

This is one reason compound data cannot be reduced to a single "Gibbs energy number."

## Why CDB is binary

A binary database loads efficiently and can preserve a compact fixed record layout, but it is not convenient for line-by-line comparison in a text editor.

That distinction mattered historically to database developers.

Solution-model development involves frequent small changes to interaction parameters and model declarations, so text-based solution formats were attractive for version comparison. Compound data, by contrast, remained in the binary CDB family.

For an ordinary PyroApp user, you normally do not need to know the binary record layout. What matters is recognizing that the FactSage compound database is a master database source, not the same object as an open ChemSage DAT file.

## Legacy FactSage solution databases: `*SOLN.dat`

Before the modern Solution format, FactSage used an open-text solution database format commonly named with `*SOLN.dat`.

This format is particularly easy to confuse with a ChemSage/ChemApp `.DAT`, but they are **not the same format**.

The legacy FactSage solution DAT is a database-development file. It stores solution definitions using a fixed-width text representation in which the meaning of a value depends partly on its position in the line and on counters/model identifiers elsewhere in the block.

It was designed for FactSage's solution-database ecosystem, not as a direct ChemApp calculation file.

### Why researchers continued using it

The legacy optimization guide explains why this old format remained attractive to database developers even after a newer format existed.

It is text.

When thermodynamic parameters are being optimized, a researcher may create many versions of a database. A text comparison program can immediately show:

- which interaction coefficient changed;
- whether a new endmember was added;
- which model block was edited;
- whether an accidental edit occurred elsewhere.

That transparency is valuable.

The fixed-width format also has disadvantages. Field widths and counters impose structural limits; the legacy Pyrosearch workflow, for example, encountered the historical 999-parameter limit for a large slag solution.

So the old format is convenient for human diffing but awkward to maintain and extend.

## Modern FactSage solution databases: SLN + FDB

FactSage 7.0 introduced the modern Solution-module representation.

The old single text solution file was split conceptually into two parts:

- an open-text `.SLN` file containing the solution definitions and model structure;
- a binary `.FDB` file containing thermodynamic functions used by solution endmembers.

This division is important.

### What is in SLN?

The SLN side describes how a solution phase is constructed.

Depending on the model, it can contain concepts such as:

- solution identity and model;
- sublattices;
- species;
- endmembers;
- site amounts;
- endmember status/maintenance information;
- excess interactions;
- powers and temperature-dependent expressions;
- quadruplets or other model-specific structures;
- interpolation/extrapolation information;
- magnetic parameters;
- comments and annotations.

Not every model uses every concept.

The SLN format is text and therefore remains partly inspectable with ordinary text tools, although it is not intended to be edited casually without understanding the structure.

### What is in FDB?

The FDB provides Gibbs-energy/standard-state functions required by solution endmembers.

Physically, the FDB belongs to the same broad binary database family as the FactSage compound database, although its **role** is different.

A useful user-level mental model is:

```text
SLN
    "what is the solution and how is it mixed?"

FDB
    "what are the standard-state thermodynamic functions
     referenced by its endmembers?"
```

The modern Solution module presents these together as one database-development environment even though they are stored separately.

## Endmember functions and references

When building a solution database, an endmember may use the Gibbs-energy function of a real compound phase.

The legacy optimization guide gives examples in which functions corresponding to phases such as solid or liquid CaO are transferred into the Solution database's function collection and then referenced by endmembers.

An unstable or hypothetical endmember may instead require an additional energetic term relative to a real compound structure.

This demonstrates the relationship between "compound data" and "solution data":

- the compound side supplies physically meaningful standard-state functions;
- the solution side organizes them into a compositional model;
- additional terms describe unstable/formal endmembers and non-ideal mixing.

## Modern and legacy solution formats represent the same scientific model differently

A solution such as a slag, spinel, monoxide, or olivine is a thermodynamic concept.

It is not inherently an SLN object or a fixed-width DAT block.

The old and new FactSage formats are two storage representations of the same broad domain:

- solution;
- species;
- sublattices;
- endmembers;
- interactions;
- model-specific data.

That is why an old FactSage solution database can be imported into a modern one.

However, conversion between representations may change formatting, ordering, explicit defaults, identifiers, or other database-maintenance information. A file-to-file comparison is therefore not the same thing as a scientific equivalence check.

## Database-development information is not always calculation information

FactSage solution databases contain information useful to the database developer that ChemApp does not necessarily need to calculate a selected system.

Examples include maintenance/status information, coverage/list structures, and other provider-specific bookkeeping.

A ChemSage export may collapse or omit such information while preserving the thermodynamic model needed for calculation.

This is not automatically a loss of thermodynamic meaning. It is often a loss of **database-development representation**.

This distinction becomes important when somebody tries to use a ChemSage DAT as a backup copy of a FactSage master database. It should not be treated as one.

## Protected and open databases

Whether a FactSage database can be modified or exported in open form depends on its provider and licensing/protection state.

An unprotected development database can be used to create an open ChemSage DAT suitable for parameter inspection and optimization.

A protected database can usually be used for calculations according to its licence but does not give the user unrestricted access to its internal assessed parameters.

The same principle appears later in the ChemApp world as the distinction between open DAT and protected CST.

## What a PyroApp user needs to remember

You do not need to memorize the internal file grammar.

Remember these practical rules:

1. **CDB** is a FactSage compound database family.
2. **legacy `*SOLN.dat`** is an old FactSage solution-development format.
3. **SLN + FDB** is the modern FactSage solution-database representation.
4. **ChemSage/ChemApp DAT** is a different single-file calculation format.
5. File extensions alone are not enough to infer semantic equivalence.
6. A ChemSage export should be treated as a calculation representation, not a complete archival round trip of the master FactSage database.

The next page, [ChemSage / ChemApp datafiles](../chemsage-datafile.md), explains the format that PyroApp normally uses directly.
