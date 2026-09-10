# ChemApp runtime information

PyroApp exposes several formulas that query the selected ChemApp runtime and licence environment.

Useful checks include:

```excel
=XLL_CA_VERSION()
=XLL_CA_ISLITE()
=XLL_CA_USER_ID()
=XLL_CA_LICENSE_HOLDER_NAME()
=XLL_CA_PROGRAM_ID()
=XLL_CA_DONGLE_INFO()
=XLL_CA_EXPIRATION_DATE()
```

`XLL_CA_DONGLE_INFO` returns two cells (a name/description and dongle identifier). `XLL_CA_EXPIRATION_DATE` returns month and year fields.

These functions are particularly useful before troubleshooting a protected CST file: a CST file may be tied to a particular user/licence environment.

`XLL_CA_DIMENSIONS_MAX()` reports ChemApp runtime capacity information. `XLL_CA_DIMENSIONS(datafile)` is different in the current client: it is a local DAT query and reports structural counts from an open DAT file.

When gRPC is selected, runtime information is associated with the configured runtime path/server implementation rather than the local DAT parser.
