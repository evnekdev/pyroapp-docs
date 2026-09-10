# XLL_CA_LIST_INTERACTIONS_G

**Availability:** stable, open-DAT only.

Lists ordinary (non-magnetic) interaction descriptions for the requested solution phases.

## Syntax

```excel
=XLL_CA_LIST_INTERACTIONS_G(datafile,phases,[update_token])
```

## Returns

A one-column spill range of stable interaction descriptions derived from the parsed DAT model.

!!! important "Use the returned descriptions"
    Pass these values directly to interaction GET/SET functions. PyroApp does not use ChemApp `TQLPAR` display strings as interaction identity because native formatting can misrepresent powers greater than 9. Multi-digit powers are preserved by the DAT parser.

For magnetic interactions use [`XLL_CA_LIST_INTERACTIONS_M`](ca_list_interactions_m.md).