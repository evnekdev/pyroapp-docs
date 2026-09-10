# XLL_CA_GET_COMPOUND_CP

**Availability:** stable, open-DAT only.

Reads thermochemical coefficient data for selected compound ranges. The historical function name says `CP`; the exact physical interpretation of the stored coefficient vector depends on the DAT thermochemical representation.

## Syntax

```excel
=XLL_CA_GET_COMPOUND_CP(datafile,phases,range_indices,value_indices,[update_token])
```

- `range_indices` are one-based.
- `value_indices` are `1..10` for one displayed coefficient, or `0` to return the complete ten-coefficient display vector for the corresponding range.

## Returns

A numeric matrix. The safest rectangular usage is to request the same coefficient mode for every target (all `0`, or one indexed coefficient per target).

PyroApp maps the ten public coefficient positions to the correct DAT source fields; callers should use the public 1..10 ordering rather than physical record offsets.