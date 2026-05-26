# EXCEL REQUIREMENTS

PyroApp widely uses dynamic arrays in Excel which were added to MS Office 365 Suite; it has been thoroughly tested using this version and it is therefore most desirable. To learn more about dynamic arrays, visit (Excel Dynamic Arrays)[https://support.microsoft.com/en-au/office/guidelines-and-examples-of-array-formulas-7d94a64e-3ff3-4686-9372-ecfd5caa57c7]

## Desktop vs online Excel

PyroApp heavily depends on two factors : locally installed ChemApp libraries which require a dongle key for activation and also either VBA or Excel C API. All these features are only available in Desktop Excel.

## Platform requirements

Custom Excel functions in xlwings (PyroApp 1.0) are supported only on Windows, and, apparently, on MacOS (although the author did not test it). Excel C API (XLL SDK) in PyroApp 2.0 is available only on Desktop Windows Excel distributions.

To read more about xlwings, please refer to the official use guide [xlwings in Excel](https://www.xlwings.org/).

Excel C API description can be found at the official Microsoft source [Excel C API](https://learn.microsoft.com/en-us/office/client-developer/excel/programming-with-the-c-api-in-excel). The most detailed practical guide was written by S. Dalton [1](#references).

## 64bit vs 32bit Excel

Both PyroApp 1.0 and PyroApp 2.0 run ChemApp code using client/server model (the first one executes code using a local Python server, the latter employs IPC - Interprocess Communication). Therefore, both versions of PyroApp are not sensitive to the bitness of the hosting Excel application.


## Bibliography

1. Dalton, S. (2007). *Financial Applications Using Excel Add-in Development in C/C++*. Wiley.
