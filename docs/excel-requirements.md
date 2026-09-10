# Excel requirements

PyroApp 2 runs in **desktop Microsoft Excel for Windows** through an Excel-DNA XLL add-in.

## Required Excel capabilities

Use a current Microsoft 365 / desktop Excel version with dynamic arrays. PyroApp frequently returns vectors and matrices as spill ranges, so modern dynamic-array behavior is part of the normal interface.

Excel for the web cannot load a native XLL and therefore cannot run PyroApp 2.

## 32-bit and 64-bit Excel

PyroApp distributions are architecture-specific at the Excel/XLL boundary. Use the package matching the bitness reported by **File → Account → About Excel**.

The companion open-DAT library is built in both x86 and x64 forms, and PyroApp selects the one matching the Excel process. Local ChemApp execution occurs in a separate worker, but the released worker/native runtime combination must also be prepared with compatible architecture.

Do not mix a 64-bit worker with a 32-bit-only ChemApp DLL or vice versa.

## Workbook format

PyroApp 2 itself does not require an `.xlsm` workbook merely to call XLL functions. Use `.xlsx` unless your workbook separately contains VBA/macros that require `.xlsm`.

## Network access

Remote gRPC calculation requires connectivity to the configured PyroApp server address/port. Open-DAT LIST/GET/SET functions remain local and do not require server access.

See [Install PyroApp 2](installation-2.0.md) and [Architecture and transports](pyroapp-architecture-2.0.md).