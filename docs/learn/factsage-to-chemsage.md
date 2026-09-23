# From FactSage to a ChemSage/ChemApp datafile

A common PyroApp workflow begins in FactSage.

You choose the chemical system and phases in FactSage, export a ChemSage/ChemApp datafile, and then use that datafile repeatedly from Excel.

This sounds like a file conversion, but it is better understood as a **projection**.

The FactSage database environment can contain much more information than one ChemApp calculation needs. The exported datafile contains the selected thermodynamic model in the representation required by ChemApp.

## The practical workflow

A typical workflow is:

1. open FactSage Equilib or Phase Diagram;
2. select the elements/components of interest;
3. select the relevant compound and solution databases;
4. make an appropriate phase selection;
5. confirm that the FactSage calculation behaves as expected;
6. export a ChemSage/ChemApp file;
7. keep the exported file beside the PyroApp workbook;
8. use PyroApp for repeated calculations, target evaluation, plotting, or optimization.

The important part is steps 2 through 5.

The export can only represent the model that you actually selected.

## Export the chemical scope you intend to study

A large FactSage database may contain dozens of elements and many phase models.

A PyroApp workbook is usually easier to understand when its datafile contains the system actually being studied.

For example, a Ca-Zn-Si-O optimization might use:

- Ca;
- Zn;
- Si;
- O;
- relevant slag/liquid solution;
- monoxide or zincite solid solutions;
- required stoichiometric compounds;
- gas only if the experimental/calculation conditions require it.

Do not export every available phase merely because it exists.

Conversely, do not omit a physically important competing phase simply to make the desired phase diagram look simpler.

Phase selection is part of the scientific definition of the calculation.

## One ChemSage file combines information that FactSage stores separately

FactSage separates compound and solution database roles.

The ChemSage/ChemApp datafile contains the information needed for the selected system in one calculation file.

This includes, as applicable:

- system-component definitions;
- stoichiometric phases;
- solution phases;
- solution constituents/endmembers;
- standard-state functions;
- heat-capacity data;
- interaction parameters;
- model-specific records.

That self-contained nature is one reason ChemSage files are convenient for reproducible calculation projects.

A workbook and its matching DAT can be archived together as a compact representation of the calculation model used for that project.

## But the export is not a master-database backup

This is the most important caution on this page.

A FactSage database contains information used for database development and maintenance that a ChemApp calculation does not necessarily require.

During export, some information may be:

- omitted;
- reorganized;
- represented by a derived expression;
- converted into ChemApp-specific phase structures;
- duplicated into several calculation phases where the equilibrium engine requires separate copies.

Examples established from the format relationships include:

- FactSage endmember maintenance/status information has no direct ChemSage equivalent;
- FactSage coverage/list bookkeeping is not a ChemSage calculation object;
- a richer FactSage endmember Gibbs-function representation can become one ChemSage expression;
- immiscibility behavior can require multiple ChemSage copies of one underlying FactSage solution.

Therefore:

> Keep the FactSage database as the master source. Treat the ChemSage file as an exported calculation representation.

## Names may not be identical

Phase and constituent names are identifiers within one representation.

Do not assume that a name visible in the FactSage GUI will always appear byte-for-byte the same in a ChemSage file.

Export/import tools may apply:

- phase labels;
- suffixes;
- copy numbers;
- state labels;
- provider naming conventions.

This is why PyroApp tutorials recommend using `XLL_CA_LIST_PHASES`, `XLL_CA_LIST_CONSTITUENTS`, and related functions to obtain the names from the actual datafile used by the workbook.

The datafile is the naming authority for that calculation.

## Solution copies and immiscibility

Some solution phases can split into two or more coexisting compositions.

A calculation engine needs a way to represent those simultaneous instances.

In the FactSage database-development environment, immiscibility may be represented partly through solution metadata and selection suggestions.

A ChemSage calculation export can instead contain multiple phase copies representing the same underlying model so that more than one composition of that solution can coexist in the equilibrium calculation.

This is another reason not to equate "one FactSage solution record" with "one ChemApp phase name."

## Open DAT versus protected CST

If the source FactSage database is open and you have the necessary rights, an open ChemSage `.DAT` can be produced for calculation and model-development work.

This is the preferred format for PyroApp optimization because the model parameters can be inspected and changed.

A protected source database can be exported into a protected ChemApp representation according to the provider/licence rules. The commonly encountered protected format is `.CST`.

A CST can be useful for calculations, but its internal parameters are intentionally unavailable to the PyroApp DAT editing workflow.

So:

- **equilibrium calculation** can use protected data when ChemApp/licensing permits it;
- **parameter optimization** needs an open model representation.

## Why round trips should be treated carefully

A tempting workflow is:

```text
FactSage database
    -> ChemSage DAT
    -> modify DAT
    -> convert back to FactSage
```

Do not assume this is lossless.

The legacy PyroApp documentation recorded concrete problems in the FactSage 7.3-era reverse-conversion workflow, including loss of interaction-power information and changes to solution-phase naming.

Those observations are historical and should not be read as a statement about every modern FactSage release. They are, however, a strong reason for a general rule:

> Validate a reverse conversion scientifically and structurally. Never assume that a successful import means every database-development detail survived unchanged.

For serious database work, the master FactSage database should remain authoritative.

## A robust project structure

For a research project, a useful folder structure is:

```text
project/
    model/
        master-reference-information.txt
        exported-working.dat
        exported-baseline.dat
    workbook/
        assessment.xlsx
    figures/
        reference.fig
        targets.fig
    notes/
        provenance.md
```

The exact filenames are not important.

The separation is.

Keep:

- an untouched baseline DAT;
- a working DAT that PyroApp is allowed to modify;
- a record of the FactSage source/database version used to create it;
- the workbook that defines the target calculations;
- reference phase diagrams where useful.

This makes the optimization reproducible.

## Re-export when the master database changes

If an important structural change is made in the master FactSage database — for example a new endmember, a new phase, or a different solution model — it is usually safer to create a new ChemSage export than to try to patch an old project DAT into a completely different structure.

Parameter-only optimization is different. There, deliberately modifying a working DAT is the point of the exercise.

Distinguish:

- **parameter changes within one established model**;
- **structural model changes**.

The first is well suited to a PyroApp optimization workbook. The second belongs primarily in database-development work and should then be re-exported.

## Validate the export before optimizing

Before constructing a derivative matrix or changing parameters:

1. calculate several known equilibria in FactSage;
2. calculate corresponding points with the exported file;
3. confirm phase identities and phase selection;
4. confirm units and composition basis;
5. inspect solution/compound lists in PyroApp;
6. verify important reference phase boundaries.

This establishes that the calculation file represents the intended model.

Otherwise an optimizer may spend hours fitting a problem that was created by an export or setup mistake rather than by bad thermodynamic parameters.

## The role of Figure files

Reference `.FIG` files are useful companions to an optimization project.

They can preserve:

- a reference phase diagram;
- experimental target points;
- labels and phase fields used during assessment.

They are not thermodynamic databases. They are visual/plot documents.

In the published PyroApp tutorial assets, FIG files are therefore provided as reference material while the calculations themselves use DAT files.

## The recommended authority chain

For a typical open-database assessment:

```text
master FactSage database
        ↓ export
baseline ChemSage DAT
        ↓ copy
working ChemSage DAT
        ↓
PyroApp calculations and parameter edits
        ↓
validated optimized parameters
        ↓
deliberate update of master FactSage database
```

This prevents a temporary calculation export from silently becoming the only surviving master copy of the database.

Continue with [ChemSage / ChemApp datafiles](../chemsage-datafile.md) for the structure and practical meaning of the files PyroApp uses directly.
