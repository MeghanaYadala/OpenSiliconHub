# *UART Transmitter (UART_TX)*
### *(Source: [UART_TX.v](../RTL/UART_TX.v))*
## *About*
- The UART Transmitter module implements the transmit side of a Universal Asynchronous Receiver/Transmitter (UART).<br>
- It serializes 8-bit parallel data into a UART frame consisting of a **start bit (0)**, **8 data bits (LSB first)**, and a **stop bit (1)**.<br>
- Operates as a sequential circuit with internal counters to match the specified baud rate.<br>
- Provides status signals to indicate busy and completion of transmission.<br>

### *Parameters*
- `clk_freq` – System clock frequency (default: 50 MHz).
- `baud_rate` – UART baud rate (default: 9600).
- Internal timing is derived from `clks_per_bit = clk_freq / baud_rate`.

## *Instantiation*
To use the `UART_TX` module in your design:

```verilog
UART_TX #(
  .clk_freq(50000000), // System clock frequency
  .baud_rate(9600)     // Baud rate
) u_uart_tx (
  .clk(clk),           // System clock
  .reset(rst),         // Reset input (active high)
  .tx_start(start_tx), // Start transmission
  .data(tx_data),      // Parallel data to transmit
  .tx_line(tx_line),   // Serial output line
  .tx_busy(tx_busy),   // Indicates transmission in progress
  .tx_done(tx_done)    // Signals completion of transmission
);
```
Override parameters `clk_freq` and `baud_rate` at instantiation.

### Ports
| Name   | Direction | Width     | Description              |
|--------|-----------|-----------|--------------------------|
| clk   | input     | 1 bit      | 	System clock  |
| reset | input     | 1 bit      | 	Reset input (active high)   |
| tx_start | input   | 1 bit | Start transmission signal  |
| data | input | 8 bits | Parallel data to be transmitted |
| tx_line | output | 1 bit |Serial output line (UART frame)| 
|tx_busy | output | 1 bit | Indicates transmission in progress |
|tx_done| output | 1 bit|  
Signals completion of transmission |

## *Edge Cases & Behavior*
- Reset:<br> When reset=1, FSM resets, counters are cleared, tx_line=1 (idle), and outputs are reset.
- Start transmission: <br> When tx_start=1 and tx_busy=0, the module loads the frame {stop_bit, data, start_bit} into s_reg and begins transmission.
- Frame format:<br>

Start bit = 0

Data bits = 8 bits (LSB first)

Stop bit = 1

- Bit timing:<br>  Each bit is held on tx_line for clks_per_bit cycles, ensuring correct baud rate.
- Completion: After transmitting all 10 bits (start, 8 data, stop), tx_busy=0, tx_done=1, and tx_line=1 (idle).
- Status signals:<br>

tx_busy=1 during transmission.

tx_done=1 for one cycle when transmission completes.

tx_line=1 when idle (no transmission).

- Sequential nature: <br> Updates occur on rising edge of clk or reset. Synthesizable as flip-flops with counter logic.
