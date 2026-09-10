# Phase models

A solution phase needs a mathematical model for its configurational and excess Gibbs energy. The model is stored in the thermodynamic datafile; ordinary PyroApp users do not select a model in the Excel formula.

ChemSage/ChemApp DAT files can contain families such as ideal-mixing models, Redlich-Kister-style models, sublattice/compound-energy models, quasichemical models, aqueous models and magnetic extensions. Exact record layouts and parameter meanings differ between model families.

## What PyroApp exposes

For open DAT files, PyroApp uses the semantic model parsed by `chemsage-parser` to list constituents/species/interactions and to read or edit supported parameters. This is important for interactions: an interaction is not merely a display string, and its participants, powers and model-specific role remain part of its identity.

`XLL_CA_CALCULATE` does not reimplement the model equations. It loads the complete datafile into ChemApp and lets ChemApp evaluate the model during Gibbs-energy minimisation.

## Practical rule

If your goal is equilibrium calculation, you normally only need the correct phase and constituent names. If your goal is database assessment or optimization, first identify the phase model and confirm that the GET/SET function you intend to use exposes the required parameter family.
