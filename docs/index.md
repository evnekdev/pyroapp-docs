# PyroApp

PyroApp is a custom software developed by Dr Evgenii Nekhoroshev at Pyrosearch, University of Queensland.

Its primary purpose is to make complex thermochemical calculations available in Excel spreadsheets with minimum setup requirements and no programmic knowledge.

## Pre-existing software

The existing software, such as FactSage, makes it possible to export its calculations to Excel, but the calculations are rather lengthly and require a lot of manual setup to make every export work.

ChemApp is another professional solution for complex thermochemical equilibria; however, it does not have a graphical interface and an engineer is faced with a high learning curve requiring knowledge of programming languages (C/C++, Fortran, Python).
## PyroApp benefits

PyroApp offers the flexibility of ChemApp, but wraps it inside custom Excel functions so the user does not have to interact with ChemApp directly.

## Legacy version of PyroApp

The older version of PyroApp, used internally at Pyrosearch, connected to Excel using xlwings AddIn which required a Python installation. Although quite useful, it did not offer complete integration with the Excel environment (function tooltips were not available, for example) and the time spent launching a Python server internally (xlwings hardwired design) made PyroApp execution somewhat slow and prone to automation errors.

## C API and Excel-DNA project

Serious professional applications for Excel use so-called Excel C API, which is famous for its blazing speed and full integration with the Excel environment. However, use of raw Excel C API is a daunting task due to inner complexity of Excel programming model and previously was reserved only for proprietaty financial software for investment firms on Wall Street, which require fast response times and reliability.

Recently, an open source project, called [ExcelDna](https://excel-dna.net/) has been developed which greatly simplifies development of custom Excel XLL addins using C API/#NET technology.

## The current PyroApp edition

The current edition of PyroApp was rewritten using C# as the Excel interfacing language and Rust for backend calculations.

## References

