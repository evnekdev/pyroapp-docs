# Function reference

Current PyroApp 2 Excel names use the `XLL_` prefix. Follow the links below for syntax and return shapes.

## Runtime controls

- [`XLL_PYROAPP_TRANSPORT`](runtime-transports.md#show-the-active-transport)
- [`XLL_PYROAPP_USE_IPC`](runtime-transports.md#use-local-ipc)
- [`XLL_PYROAPP_USE_GRPC`](runtime-transports.md#use-grpc)
- [`XLL_PYROAPP_GRPC_ADDRESS`](runtime-transports.md#read-or-change-the-grpc-address)

## ChemApp/runtime information

- [`XLL_CA_CHEMAPPDLLS`](functions/ca_chemappdlls.md)
- [`XLL_CA_VERSION`](functions/ca_version.md)
- [`XLL_CA_ISLITE`](functions/ca_islite.md)
- [`XLL_CA_DIMENSIONS_MAX`](functions/ca_dimensions_max.md)
- [`XLL_CA_DIMENSIONS`](functions/ca_dimensions.md) — local DAT structure
- [`XLL_CA_USER_ID`](functions/ca_user_id.md)
- [`XLL_CA_LICENSE_HOLDER_NAME`](functions/ca_license_holder_name.md)
- [`XLL_CA_PROGRAM_ID`](functions/ca_program_id.md)
- [`XLL_CA_DONGLE_INFO`](functions/ca_dongle_info.md)
- [`XLL_CA_EXPIRATION_DATE`](functions/ca_expiration_date.md)
- [`XLL_CA_COPYRIGHT`](functions/ca_copyright.md)

## List DAT entities

- [`XLL_CA_LIST_COMPONENTS`](functions/ca_list_components.md)
- [`XLL_CA_LIST_PHASES`](functions/ca_list_phases.md)
- [`XLL_CA_LIST_SOLUTIONS`](functions/ca_list_solutions.md)
- [`XLL_CA_LIST_COMPOUNDS`](functions/ca_list_compounds.md)
- [`XLL_CA_LIST_SPECIES`](functions/ca_list_species.md)
- [`XLL_CA_LIST_CONSTITUENTS`](functions/ca_list_constituents.md)
- [`XLL_CA_LIST_INTERACTIONS_G`](functions/ca_list_interactions_g.md)
- [`XLL_CA_LIST_INTERACTIONS_M`](functions/ca_list_interactions_m.md)

## Get DAT parameters

- [`XLL_CA_GET_COMPONENT_WEIGHTS`](functions/ca_get_component_weights.md)
- [`XLL_CA_GET_COMPONENT_STOICHIOMETRY`](functions/ca_get_component_stoichiometry.md)
- [`XLL_CA_GET_COMPOUND_H298`](functions/ca_get_compound_h298.md)
- [`XLL_CA_GET_COMPOUND_S298`](functions/ca_get_compound_s298.md)
- [`XLL_CA_GET_COMPOUND_TUPPER`](functions/ca_get_compound_tupper.md)
- [`XLL_CA_GET_COMPOUND_RANGE_COUNT`](functions/ca_get_compound_range_count.md)
- [`XLL_CA_GET_COMPOUND_CP`](functions/ca_get_compound_cp.md)
- [`XLL_CA_GET_COMPOUND_WEIGHTS`](functions/ca_get_compound_weights.md)
- [`XLL_CA_GET_COMPOUND_STOICHIOMETRY`](functions/ca_get_compound_stoichiometry.md)
- [`XLL_CA_GET_CONSTITUENT_H298`](functions/ca_get_constituent_h298.md)
- [`XLL_CA_GET_CONSTITUENT_S298`](functions/ca_get_constituent_s298.md)
- [`XLL_CA_GET_CONSTITUENT_TUPPER`](functions/ca_get_constituent_tupper.md)
- [`XLL_CA_GET_CONSTITUENT_RANGE_COUNT`](functions/ca_get_constituent_range_count.md)
- [`XLL_CA_GET_CONSTITUENT_CP`](functions/ca_get_constituent_cp.md)
- [`XLL_CA_GET_CONSTITUENT_WEIGHTS`](functions/ca_get_constituent_weights.md)
- [`XLL_CA_GET_CONSTITUENT_STOICHIOMETRY`](functions/ca_get_constituent_stoichiometry.md)
- [`XLL_CA_GET_INTERACTION_INDICES`](functions/ca_get_interaction_indices.md)
- [`XLL_CA_GET_INTERACTIONS_PARAMETERS_G`](functions/ca_get_interaction_parameters_g.md)
- [`XLL_CA_GET_INTERACTIONS_PARAMETERS_M`](functions/ca_get_interaction_parameters_m.md)

All GET functions above are local and open-DAT only.

## Set DAT parameters

- [`XLL_CA_SET_COMPOUND_H298`](functions/ca_set_compound_h298.md)
- [`XLL_CA_SET_COMPOUND_S298`](functions/ca_set_compound_s298.md)
- [`XLL_CA_SET_COMPOUND_CP`](functions/ca_set_compound_cp.md)
- [`XLL_CA_SET_CONSTITUENT_H298`](functions/ca_set_constituent_h298.md)
- [`XLL_CA_SET_CONSTITUENT_S298`](functions/ca_set_constituent_s298.md)
- [`XLL_CA_SET_CONSTITUENT_CP`](functions/ca_set_constituent_cp.md)
- [`XLL_CA_SET_INTERACTION_PARAMETERS_G`](functions/ca_set_interaction_parameters_g.md)
- [`XLL_CA_SET_INTERACTION_PARAMETERS_M`](functions/ca_set_interaction_parameters_m.md)

SET functions atomically modify the DAT file at the supplied path.

## Calculate

- [`XLL_CA_CALCULATE`](functions/ca_calculate.md)

`XLL_CA_CALCULATE` is the ChemApp equilibrium path and is the function controlled by IPC/gRPC selection.

## Data manipulation

- [`XLL_DATA_CHANGE_BASIS`](functions/data_change_basis.md) — stable
- [`XLL_DATA_REPEAT`](functions/data_repeat.md) — backend in development
- [`XLL_DATA_GENERATE_MESH`](functions/data_generate_mesh.md) — backend in development

## Continuous optimization

- [`XLL_LINEAR_REGRESSION`](functions/linear_regression.md) — backend in development
- [`XLL_BEST_COMBINATION`](functions/best_combination.md) — backend in development
- [`XLL_PD_ERROR_TABLE`](functions/pd_error_table.md) — backend in development
