# Function reference

This page groups the PyroApp 2 Excel functions by purpose. Current formula names use the `XLL_` prefix.

## Runtime controls

| Function | Purpose |
|---|---|
| `XLL_PYROAPP_TRANSPORT` | Show IPC/gRPC selection. |
| `XLL_PYROAPP_USE_IPC` | Select local IPC calculations. |
| `XLL_PYROAPP_USE_GRPC` | Select remote gRPC calculations. |
| `XLL_PYROAPP_GRPC_ADDRESS` | Read or set the gRPC address. |

See [Runtime transport controls](runtime-transports.md).

## ChemApp/runtime information

`XLL_CA_CHEMAPPDLLS`, `XLL_CA_VERSION`, `XLL_CA_ISLITE`, `XLL_CA_DIMENSIONS_MAX`, `XLL_CA_DIMENSIONS`, `XLL_CA_USER_ID`, `XLL_CA_LICENSE_HOLDER_NAME`, `XLL_CA_PROGRAM_ID`, `XLL_CA_DONGLE_INFO`, `XLL_CA_EXPIRATION_DATE`, `XLL_CA_COPYRIGHT`.

`XLL_CA_DIMENSIONS` is a local DAT structural query in the current client; the other licence/runtime metadata functions use the selected runtime capability.

## List DAT entities

`XLL_CA_LIST_COMPONENTS`, `XLL_CA_LIST_PHASES`, `XLL_CA_LIST_SOLUTIONS`, `XLL_CA_LIST_COMPOUNDS`, `XLL_CA_LIST_SPECIES`, `XLL_CA_LIST_CONSTITUENTS`, `XLL_CA_LIST_INTERACTIONS_G`, `XLL_CA_LIST_INTERACTIONS_M`.

These are open-DAT/local functions.

## Get DAT parameters

`XLL_CA_GET_COMPONENT_WEIGHTS`, `XLL_CA_GET_COMPONENT_STOICHIOMETRY`, `XLL_CA_GET_COMPOUND_WEIGHTS`, `XLL_CA_GET_CONSTITUENT_WEIGHTS`, `XLL_CA_GET_COMPOUND_STOICHIOMETRY`, `XLL_CA_GET_CONSTITUENT_STOICHIOMETRY`, `XLL_CA_GET_COMPOUND_H298`, `XLL_CA_GET_COMPOUND_S298`, `XLL_CA_GET_CONSTITUENT_H298`, `XLL_CA_GET_CONSTITUENT_S298`, `XLL_CA_GET_COMPOUND_RANGE_COUNT`, `XLL_CA_GET_CONSTITUENT_RANGE_COUNT`, `XLL_CA_GET_COMPOUND_TUPPER`, `XLL_CA_GET_CONSTITUENT_TUPPER`, `XLL_CA_GET_COMPOUND_CP`, `XLL_CA_GET_CONSTITUENT_CP`, `XLL_CA_GET_INTERACTION_INDICES`, `XLL_CA_GET_INTERACTIONS_PARAMETERS_G`, `XLL_CA_GET_INTERACTIONS_PARAMETERS_M`.

All current GET functions are local and DAT-only.

## Set DAT parameters

`XLL_CA_SET_COMPOUND_H298`, `XLL_CA_SET_COMPOUND_S298`, `XLL_CA_SET_CONSTITUENT_H298`, `XLL_CA_SET_CONSTITUENT_S298`, `XLL_CA_SET_COMPOUND_CP`, `XLL_CA_SET_CONSTITUENT_CP`, `XLL_CA_SET_INTERACTION_PARAMETERS_G`, `XLL_CA_SET_INTERACTION_PARAMETERS_M`.

All current SET functions are local, DAT-only, and update the file at the supplied path atomically.

## Calculate

[`XLL_CA_CALCULATE`](functions/ca_calculate.md) performs ChemApp equilibrium calculations. It is the operation affected by the IPC/gRPC transport selection and the only normal operation that uploads a datafile for remote execution.

## Data manipulation

`XLL_DATA_CHANGE_BASIS` is available for formula-basis / mole-weight conversion. `XLL_DATA_REPEAT` and `XLL_DATA_GENERATE_MESH` are present in the Excel surface but their PyroApp 2 backend is still under development; do not build production workbooks around them yet.

## Optimization

`XLL_LINEAR_REGRESSION`, `XLL_BEST_COMBINATION`, and `XLL_PD_ERROR_TABLE` retain the intended continuous-optimization interfaces from legacy PyroApp, but the current PyroApp 2 Rust backend remains incomplete. Their reference pages are marked **experimental/in development** rather than pretending the interface is production-ready.
