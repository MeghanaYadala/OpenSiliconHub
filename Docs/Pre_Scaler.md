# *Pre-Scaler*
### *(Source: [Pre_Scaler.v](../RTL/Pre_Scaler.v))*
## *About*
- Pre-Scaler is a sequential circuit that divides the input clock frequency by a specified factor (`DIVISOR`).<br>
- It generates a slower clock (`clk_out`) by toggling after a set number of input clock cycles.<br>
- Commonly used for clock division, baud rate generation, and timing control in digital systems.<br>

### *Parameter*
- `DIVISOR` – Division factor for input clock. Determines how many input cycles are required before toggling `clk_out`.

## *Instantiation*
To use the `Pre_Scaler` module in your design:

```verilog
Pre_Scaler #(
  .DIVISOR(4)   // Clock division factor
) u_prescaler (
  .clk_in(clk),     // Input clock
  .reset_n(rst_n),  // Active-low reset
  .clk_out(clk_div) // Divided clock output
);
```
Override parameters `DIVISOR` at instantiation.

### Ports
| Name   | Direction | Width     | Description              |
|--------|-----------|-----------|--------------------------|
| clk_in   | input     | 1 bit | Input clock   |
| reset_n  | input     | 1 bit | Active-low reset |
| clk_out  | output    | 1 bit | Divided clock output |

## *Edge Cases & Behavior*
- Reset:<br> When reset_n=0, counter and output clock are cleared (clk_out=0).
- Division factor:<br> Output clock toggles every DIVISOR input cycles, effectively dividing frequency by 2*DIVISOR.
- Sequential nature:<br> Updates occur on rising edge of clk_in or reset. Synthesizable as flip-flops with counter logic.
- Parameterization:<br> Counter width is automatically adjusted using $clog2(DIVISOR) to fit the division factor.
- Special case:<br> If DIVISOR=1, clk_out toggles every cycle, effectively dividing by 2.
