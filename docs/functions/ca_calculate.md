# CA_CALCULATE

## Description

The main function in PyroApp, it takes input conditions in table format and returns the a table of corresponding results.

## Syntax

```excel
=CA_CALCULATE(datafile, input_header, input, output_header, [entered], [update_token])
```

## Arguments

  | **Argument** | **Description** |
  |---|---|
  | datafile      | Absolute or relative filepath to a ChemSage datafile (.dat/.cst) |
  | input_header  | A 3xi block of *input conditions*. For details on how input conditions are entered, refer to [Input Header Options](../../input_conditions). |
  | input         | A nxi block of input condition values for each row out of n calculations. |
  | output_header | A 3xo block of *output properties*. For details on how output properties are selected, refer to [Output Properties](../../output_properties). |
  | entered       | TODO |
  | update_token  | A special argument (optional), can be any value and does not affect the outcome of the calculation; if changed, forces Excel to recalculate the formula. This argument is useful in cases when the datafile is changed/updated outside of Excel and Excel is not aware of the changes to make recalculation by itself. |

## Returns

## Underlying ChemApp routines

