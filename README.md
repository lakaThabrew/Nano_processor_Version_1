# 4-bit Nanoprocessor Design – CS1050 Lab 9–10

This repository contains our team project for Lab 9–10 of the **Computer Organization and Digital Design (CS1050)** course at the **Department of Computer Science and Engineering, University of Moratuwa**. The goal of this lab is to collaboratively design and implement a functional 4-bit nanoprocessor that can execute a small instruction set.

## 🔍 Project Overview

We designed a simple microprocessor (referred to as a *nanoprocessor*) capable of executing a limited number of instructions. The system includes essential components such as:
- 4-bit arithmetic unit (add/subtract)
- 3-bit program counter
- Register bank with 8 registers
- Instruction decoder
- Multiplexers and tri-state buses
- ROM-based instruction memory

### ✅ Supported Instructions
Our nanoprocessor supports the following 4 instructions:

| Instruction | Description                        | Format Summary                       |
|-------------|------------------------------------|--------------------------------------|
| `MOVI R, d` | Move immediate value `d` to `R`    | `10RRR000dddd`                       |
| `ADD Ra, Rb`| Add `Rb` to `Ra`                   | `00aaa bbb0000`                      |
| `NEG R`     | Take two's complement of register R| `01RRR0000000`                       |
| `JZR R, d`  | Jump to `d` if register `R` is zero| `11RRR0000ddd`                       |

## 🧩 Components Implemented
- **4-bit Add/Subtract Unit** – based on Lab 3's RCA, supports 2's complement arithmetic.
- **3-bit Adder** – for incrementing the program counter.
- **Register Bank** – 8 general purpose 4-bit registers; `R0` is hardcoded to zero.
- **Multiplexers** – 2-way and 8-way muxes to manage data flow between components.
- **Program ROM** – Hardcoded with machine code version of an assembly program.
- **Instruction Decoder** – Decodes binary instructions and controls the processor.
- **Control Signals & Buses** – 3, 4, and 12-bit buses to simplify wiring.

## 💻 Tools & Platform
- **VHDL** (VHSIC Hardware Description Language)
- **Vivado Design Suite** for simulation and implementation
- **BASYS 3 FPGA Board** for physical deployment and testing

## 🚀 Sample Program

Our implemented program calculates the total of numbers from 1 to 3 using only the supported instruction set. The result is stored in register `R7`.

```assembly
MOVI R1, 3
MOVI R2, 1
MOVI R3, 0
ADD R3, R1
NEG R2
ADD R1, R2
JZR R1, 6
JZR R0, 2
```
## Testing & Verification
- Simulated each module independently.

- Verified the full processor functionality using test benches.

- The program was executed on the BASYS 3 board using a slow clock (2- 3s per tick) to observe execution.

- Output was displayed via LEDs and 7-segment displays.
