# *Multiply-Accumulate (MAC)*
### *(Source: [MAC.v](../RTL/MAC.v))*
## *About*
- The MAC (Multiply-Accumulate) module performs a multiplication of two inputs and adds a third input.<br>
- It is a purely combinational block, producing the result in one cycle.<br>
- Commonly used in DSP (Digital Signal Processing), arithmetic units, and machine learning accelerators.<br>

### *Parameters*
- WIDTH_A – Bit width of input `A`.
- WIDTH_B – Bit width of input `B`.
- Output width is automatically set to `WIDTH_A + WIDTH_B` to accommodate multiplication results and accumulation.

## *Instantiation*
To use the `MAC` module in your design:

```verilog
MAC #(
  .WIDTH_A(8),   // Width of input A
  .WIDTH_B(12)   // Width of input B
) u_mac (
  .A(a_in),      // Input operand A
  .B(b_in),      // Input operand B
  .C(c_in),      // Accumulation input
  .Y(result)     // Output result = (A*B)+C
);
```
Override parameters `WIDTH_A` and `WIDTH_B` at instantiation.

### Ports
| Name   | Direction | Width     | Description              |
|--------|-----------|-----------|--------------------------|
| A | input     | WIDTH_A bits         | First operand for multiplication  |
| B | input     | WIDTH_B bits         | Second operand for multiplication |
| C | input     | WIDTH_A+WIDTH_B bits | Accumulation input                |
| Y | output    | WIDTH_A+WIDTH_B bits | Result of (A * B) + C             |

## *Edge Cases & Behavior*
- Zero inputs:<br> If A=0 or B=0, output equals C.
- Accumulation only:<br> If both A=0 and B=0, output is simply C.
- Overflow:<br> Output width is sized to WIDTH_A+WIDTH_B, ensuring multiplication fits. However, if C is large, addition may still overflow depending on synthesis and usage.
- Combinational nature:<br> No clock or reset signals. Synthesis maps directly to multiplier and adder hardware.
- DSP mapping:<br> Many FPGAs/ASICs optimize MAC into dedicated DSP blocks for efficiency.
