# Related projects

PyroApp is part of a larger set of thermodynamic and scientific-software projects.

## chemsage-parser

A Rust parser/editor for open ChemSage/ChemApp DAT files. PyroApp uses it for local LIST/GET/SET operations, including model-aware interaction identity and transactional parameter edits.

## chemapp_rs

Rust bindings and safe ownership wrappers around the native ChemApp library. PyroApp worker processes use this layer for thermodynamic execution.

## chemapp_parallel

A Rust batch-calculation project that demonstrates thread-affine ChemApp worker ownership and dynamic scheduling for strongly uneven calculation costs. Its dynamic work-claim model is a design precedent for PyroApp server scheduling.

## Legacy PyroApp

The Python/xlwings project defines the original worksheet workflows and remains a useful compatibility reference while PyroApp is completed.

These developer projects are implementation dependencies/references. A normal PyroApp user does not need to install them separately when using an approved release package.
