# Installation

Right now, a new version of PyroApp (PyroApp 2.0) based on Excel C API, is in development. It is not open to public access yet.

## PyroApp 2.0 installation guide 

[Under construction]

## Legacy PyroApp (PyroApp 1.0)

The old version of PyroApp was written in Python and used xlwings module to connect to Excel. Internally, xlwings generates custom VBA code in each Excel spreadsheet with matching function signatures and marshals code execution to a Python server.

## PyroApp 1.0 installation guide

If you have access to the code repository at [PyroApp 1.0 source code](https://github.com/evnekdev/pyroapp), you can clone into the repository using 

```cmd
git clone https://github.com/evnekdev/pyroapp.git
``` 

and then build a wheel using poetry tool in Python toolchain.

## PyroApp 1.0 dependencies

PyroApp 1.0 depends on other modules written by the author.

[TODO]

## Poetry Tool Installation

[Poetry](https://python-poetry.org/) is used for dependency management and virtual environment handling in Python projects.

### Install Poetry

#### Windows

```cmd
pip install poetry
```