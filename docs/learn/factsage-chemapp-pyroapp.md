# PyroApp, FactSage, ChemApp and ChemSage

The names **FactSage**, **ChemApp**, **ChemSage**, and **PyroApp** appear together so often that it is easy to treat them as interchangeable. They are related, but they are different things.

Understanding the distinction removes much of the confusion about databases, licences, file formats, and what a PyroApp formula is actually doing.

## The short version

| Name | Think of it as | Main user interaction |
| --- | --- | --- |
| **FactSage** | a complete thermochemical software environment and database ecosystem | graphical modules such as Equilib, Phase Diagram, Compound and Solution |
| **ChemApp** | a thermochemical equilibrium calculation engine/library | normally used by another program rather than directly by a spreadsheet user |
| **ChemSage/ChemApp datafile** | a self-contained thermodynamic description prepared for calculation | DAT/CST/BIN file loaded by ChemApp |
| **PyroApp** | an Excel interface and workflow layer around thermodynamic data and ChemApp | worksheet formulas, tables and Ribbon tools |

A useful analogy is that FactSage is a complete laboratory, ChemApp is one of the calculation instruments inside the wider ecosystem, a ChemSage datafile is the prepared sample/instruction set for that instrument, and PyroApp is a spreadsheet workbench that lets you operate the calculation repeatedly and record the results.

The analogy is imperfect, but it captures the roles.

## FactSage: the complete desktop environment

FactSage is the broadest of the four.

A FactSage user normally works through graphical modules. Different modules solve different parts of the thermodynamic workflow:

- **Equilib** sets up and calculates equilibrium states;
- **Phase Diagram** traces phase equilibria over a chosen set of variables;
- **Compound** displays and maintains stoichiometric-compound data;
- **Solution** maintains solution-phase models and their endmembers, sublattices, species, and interaction parameters;
- **Figure** displays and edits calculated figures.

FactSage also manages a pool of thermodynamic databases. A calculation may draw compound data from one database and solution phases from another.

This is an important distinction from PyroApp. PyroApp generally starts from a prepared ChemSage/ChemApp datafile rather than reproducing the entire FactSage database-pool selection interface inside Excel.

### What FactSage is particularly good at

FactSage is usually the natural place to:

- explore a completely unfamiliar chemical system;
- choose among available commercial or private databases;
- inspect which phases a database contains;
- create or maintain a FactSage solution database;
- inspect compound records graphically;
- interactively calculate and inspect phase diagrams;
- export a selected system for ChemApp use.

Its graphical modules contain a great deal of domain knowledge and are particularly helpful while a calculation is still being designed.

## ChemApp: the equilibrium engine

ChemApp is a thermochemical calculation library from GTT Technologies.

It has no need to look like FactSage because its purpose is different. A library is intended to be called by another application. The application tells ChemApp:

- which thermodynamic datafile to load;
- which phases are available;
- what the temperature, pressure, composition, or other conditions are;
- whether the calculation is an ordinary equilibrium or a target problem;
- which properties should be read after calculation.

ChemApp then evaluates the thermodynamic models in the datafile and solves the equilibrium problem.

Historically, the difficulty for many researchers was not the thermodynamics but the software interface. Calling a calculation library directly meant writing and maintaining a program. The original PyroApp documentation was explicit about this motivation: many potential ChemApp users were engineers and researchers who understood thermodynamics but did not want to become application programmers.

PyroApp exists to remove that programming barrier.

## ChemSage: a name you will mostly meet through the datafile format

ChemSage is historically connected to the same thermochemical modeling tradition. In present PyroApp work, the term **ChemSage format** is most often used when discussing the open thermodynamic datafile read by ChemApp.

For practical purposes, when this documentation says **ChemSage/ChemApp DAT**, it means the open-text calculation datafile format used by ChemApp.

This is a crucial point because FactSage also had an old solution-database format with the extension `.DAT`. The two DAT formats are not the same.

A ChemSage/ChemApp DAT is a self-contained calculation datafile. A legacy FactSage `*SOLN.dat` is a FactSage solution-database development format. Their shared extension is historical and should never be used as evidence that the files are interchangeable.

## PyroApp: the Excel workflow layer

PyroApp sits above ChemApp.

It turns a spreadsheet table into a series of thermodynamic calculations and returns the results as spreadsheet values.

For open DAT files it can also inspect and edit supported model parameters directly, which is important for thermodynamic assessment.

The user therefore sees a workflow such as:

```text
composition + T + P + phase selection
                 ↓
          Excel calculation table
                 ↓
              PyroApp
                 ↓
              ChemApp
                 ↓
   phase amounts / compositions / activities
                 ↓
              Excel
```

The spreadsheet can then calculate residuals, compare results with experiments, create plots, or propose a parameter adjustment.

## Is PyroApp an alternative to Equilib?

For many repetitive equilibrium calculations, yes in a practical sense.

The original PyroApp documentation described the main thermodynamic function as providing functionality similar to FactSage Equilib. That remains a useful way to orient a new user.

The thermodynamic problem is the same type of problem. In Equilib you describe it through a graphical interface. In PyroApp you describe it through a table.

Suppose you want to calculate equilibrium at:

- 1400 °C;
- 1 bar;
- a specified Ca-Zn-O bulk composition;
- with a selected set of phases.

In Equilib you enter those choices into fields and phase-selection controls.

In PyroApp the same information becomes columns in an input table plus an optional phase-selection range. The outputs you care about become an output header.

The result is less guided than a graphical wizard, but much easier to repeat across many rows.

## Is PyroApp an alternative to Phase Diagram?

Not in the sense of replacing the complete Phase Diagram module.

PyroApp can certainly calculate points that form a phase boundary. A workbook can:

1. generate a composition grid;
2. calculate a formation temperature at each composition;
3. reject failed or physically invalid points;
4. plot the resulting curve in Excel.

That is useful for automated studies and optimization.

But FactSage Phase Diagram provides a specialized graphical environment for defining sections, tracing equilibria, producing Figure files, and interactively examining phase-diagram topology. PyroApp does not try to reproduce every part of that interface.

The two tools can therefore complement one another. A researcher may use FactSage to understand and validate the topology, then use PyroApp to calculate a large table of target points repeatedly during optimization.

## Is PyroApp an alternative to the Compound or Solution modules?

No.

The FactSage Compound and Solution modules are database-development tools. They operate on the master FactSage database formats and expose provider-specific information needed to maintain those databases.

PyroApp works mainly with a ChemSage/ChemApp calculation datafile.

For an open DAT, PyroApp can read and change supported thermodynamic parameters. That is enough for many continuous-optimization workflows, but it is not equivalent to being a complete FactSage database editor.

The difference becomes particularly important when translating between FactSage and ChemSage formats. A ChemSage export does not necessarily contain every piece of database-development metadata that existed in the original FactSage database.

## Why would I use PyroApp if I already have FactSage?

The main reason is **workflow** rather than a new equilibrium theory.

Excel is good at:

- organizing experimental data;
- applying the same calculation to many rows;
- combining calculations and measured values;
- plotting;
- filtering;
- building masks and checks;
- calculating residuals;
- keeping an optimization table visible;
- documenting assumptions beside the calculation.

PyroApp lets the thermodynamic calculation participate in that spreadsheet workflow.

A typical use case is a thermodynamic assessment. You may use FactSage to maintain the master database and calculate reference phase diagrams, then export a ChemSage DAT and use PyroApp to evaluate hundreds of experimental target points while adjusting parameters in a controlled working copy.

Another use case is engineering sensitivity analysis: vary feed composition, temperature, pressure, and phase restrictions over a large worksheet and compare process-relevant outputs.

## Why would I use ChemApp directly instead of PyroApp?

If you are building your own software application, process simulator, or automated service, using ChemApp directly can make sense.

PyroApp is deliberately optimized for Excel users. It gives up some freedom in exchange for a transparent worksheet interface.

A researcher who wants to build a custom application with its own user interface and data structures may prefer to use ChemApp directly. A researcher who wants to calculate, plot, compare, and optimize in Excel usually does not need that additional software-development layer.

## What requires a licence?

PyroApp does not turn proprietary software or data into open data.

For local equilibrium calculation, a compatible licensed ChemApp runtime is required. Protected datafiles may have additional restrictions defined by their provider.

FactSage licences and database licences are separate matters from the PyroApp spreadsheet interface. PyroApp does not grant rights to redistribute commercial databases, ChemApp binaries, licence credentials, or protected data.

Open tutorial DAT files in this documentation are provided specifically as teaching data and are subject to the publication rules described on the [tutorial assets](../tutorials/tutorial-assets.md) page.

## The most important distinction

When interpreting a result, always keep these layers separate:

> **FactSage or a database developer supplies/maintains thermodynamic data. A ChemSage/ChemApp datafile presents a selected thermodynamic system to ChemApp. ChemApp performs the equilibrium calculation. PyroApp makes that calculation usable as part of an Excel workflow.**

The next page, [How an equilibrium calculation works](equilibrium-calculation.md), connects this software picture to the underlying thermodynamics.
