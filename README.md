# Verilog Modules Library  [![Lint Status](https://github.com/MrAbhi19/Verilog_Library/actions/workflows/verilog-lint.yml/badge.svg)](https://github.com/MrAbhi19/Verilog_Library/actions/workflows/verilog-lint.yml) [![Verilog Simulation](https://github.com/MrAbhi19/Verilog_Library/actions/workflows/verilog-test.yml/badge.svg)](https://github.com/MrAbhi19/Verilog_Library/actions/workflows/verilog-test.yml)  
![License](https://img.shields.io/github/license/MrAbhi19/Verilog_Library)

A growing collection of **reusable, parameterized Verilog modules** for learning, prototyping, and integrating into larger digital design projects.  
Each module includes documentation, a testbench, simulation waveforms (when applicable), and clean RTL aimed at readability and reusability.

This project welcomes contributions of all kinds—new modules, tests, improvements, documentation, or design suggestions.

---

## ✨ Features

- **Reusable RTL** — Clean, synthesizable, parameterized modules.  
- **Full workflow support** — Testbenches, simulation scripts, and CI-based linting/simulation.  
- **Organized structure:**
  - `RTL/` — Verilog source (`.v`)  
  - `Testbenchs/` — SystemVerilog testbenches (`.sv`)  
  - `docs/` — Module documentation and design notes (`.md`)

---

## 📦 Available Modules

Visit the **index page** for a complete list of modules, testbenches, docs, and examples:  
👉 [INDEX](#verilog-modules-index)

---

## 🤝 Contribution Guidelines

Read the contribution guide here:  
👉 [Contribution Guidelines](./Contribution.md)

If you run into any issues or want help contributing, feel free to open a Discussion:  
👉 [Discussions](../../discussions)

---

## 🧰 Tools Used

### Software
- **Icarus Verilog** — Simulation  
- **Verilator** — Linting & static checks  
- **GTKWave** — Waveform viewing  
- **EDA Playground** — Quick online testing

### Hardware Targets for Benchmarks  
- **Lattice iCE40 UP5K**  
- **Xilinx Artix-7 XC7A35T**

---

## 📬 Contact / Discussions

For module requests, ideas, improvements, or collaboration, use the **GitHub Discussions** section of the repository.

---

# Verilog Modules Index

This index provides quick access to all modules in the repository along with their associated resources.

| Module Name        | Source Code                  | Testbenches                        | Waveforms        | Documentation                     | Synthesis        |
|--------------------|------------------------------|------------------------------------|------------------|-----------------------------------|------------------|
| **ALU**            | [ALU.v](./RTL/ALU.v)     | [ALU_tb.sv](./Testbenches/ALU_tb.sv) | Pending          | [ALU.md](./Docs/ALU.md)      | Pending          |
| **Barrel Shifter** | [Barrel_shifter.v](./RTL/Barrel_shifter.v) | [Barrel_shifter_tb.sv](./Testbenches/Barrel_shifter_tb.sv) | Pending          | [Barrel_shifter.md](./Docs/Barrel_shifter.md) | Pending          |
| **Bi-directional Counter** | [Bi_count.v](./RTL/Bi_count.v) | Pending                            | Pending          | [Bi_count.md](./Docs/Bi_count.md) | Pending          |
| **Gray Counter**   | [Gray_counter.v](./RTL/Gray_counter.v) | Pending                            | Pending          | [Gray_counter.md](./Docs/Gray_counter.md) | Pending          |
| **MAC**            | [MAC.v](./RTL/MAC.v)     | [MAC_tb.sv](./Testbenches/MAC_tb.sv) | Pending          | [MAC.md](./Docs/MAC.md)      | Pending          |
| **Modulo Counter** | [Modulo_counter.v](./RTL/Modulo_counter.v) | Pending                            | Pending          | [Modulo_counter.md](./Docs/Modulo_counter.md) | Pending          |
| **Multiplier**     | [Multiplier.v](./RTL/Multiplier.v) | [Multiplier_tb.sv](./Testbenches/Multiplier_tb.sv) | Pending          | [Multiplier.md](./Docs/Multiplier.md) | Pending          |
| **PIPO**           | [PIPO.v](./RTL/PIPO.v)   | Pending                            | Pending          | [PIPO.md](./Docs/PIPO.md)    | Pending          |
| **PISO**           | [PISO.v](./RTL/PISO.v)   | Pending                            | Pending          | [PISO.md](./Docs/PISO.md)    | Pending          |
| **Pre-Scaler**     | [Pre_Scaler.v](./RTL/Pre_Scaler.v) | Pending                            | Pending          | [Pre_Scaler.md](./Docs/Pre_Scaler.md) | Pending          |
| **Priority Encoder** | [Priority_encoder.v](./RTL/Priority_encoder.v) | Pending                            | Pending          | [Priority_encoder.md](./Docs/Priority_encoder.md) | Pending          |
| **SIPO**           | [SIPO.v](./RTL/SIPO.v)   | Pending                            | Pending          | [SIPO.md](./Docs/SIPO.md)    | Pending          |
| **SISO**           | [SISO.v](./RTL/SISO.v)   | Pending                            | Pending          | [SISO.md](./Docs/SISO.md)    | Pending          |
| **SPI Master**     | [SPI_Master.v](./RTL/SPI_Master.v) | Pending                            | Pending          | [SPI_Master.md](./Docs/SPI_Master.md) | Pending          |
| **UART RX**        | [UART_RX.v](./RTL/UART_RX.v) | Pending                            | Pending          | [UART_RX.md](./Docs/UART_RX.md) | Pending          |
| **UART TX**        | [UART_TX.v](./RTL/UART_TX.v) | Pending                            | Pending          | [UART_TX.md](./Docs/UART_TX.md) | Pending          |

---
