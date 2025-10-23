# 🚀 32-bit ALU (Arithmetic Logic Unit) in Verilog HDL

![ALU Block Diagram](images/alu32.jpg)
*ALU Block Diagram*

---

## Table of Contents

- [About](#about)
- [Features](#features)
- [Architecture](#architecture)
- [Simulation & Waveforms](#simulation--waveforms)
- [References](#references)
- [How to Run](#how-to-run)
- [License](#license)
- [Contact](#contact)

---

## About

This project implements a modular **32-bit ALU** in Verilog HDL, supporting 32 unique operations.  
It demonstrates practical digital design skills, modular code structure, and simulation proficiency—ideal for recruiters seeking candidates for **FPGA**, **VLSI**, or **hardware design roles**.

- **Inputs:** Two 32-bit operands
- **Outputs:** 32-bit result, Carry flag, High/Low outputs for multiplication
- **Extensible:** Easily add status flags (Zero, Negative, Overflow, Parity) for CPU integration

---

## Features

- **Arithmetic:** Addition, Subtraction, Multiplication (full 64-bit result), Division, Increment, Decrement, Two's/One's Complement
- **Logical/Bitwise:** AND, OR, NAND, NOR, XOR, XNOR, Logical ops, Shifts
- **Comparison:** Greater-than, Equality
- **Code Conversion:** Binary ↔ Gray, Gray ↔ Binary
- **Utilities:** Bit reversal, Parity checks, Reset

---

## Architecture

- **Main ALU Code:** [`main_alu_code`](main_alu_code)
- **Testbench:** [`alu_tb`](alu_tb)

Each function is implemented as a separate, synthesizable module for clarity and scalability.

---

## Simulation & Waveforms

**RTL Schematic Example:**  
![RTL Schematic](images/alu_rtl.jpg)

**Xilinx ISim Simulation:**  
![Xilinx Simulation](images/alu_xilinx_wave.jpg)

**GTKWave Output:**  
![GTKWave Output](images/gtkwave_alu32.png)

**Icarus Verilog Testbench Output:**  
![Icarus Verilog Output](images/iverilog_output.png)

---

## References

- [`main_alu_code`](main_alu_code) — All ALU operations and modules
- [`alu_tb`](alu_tb) — Testbench for automated simulation and waveform dump
- **Academic Courses:**
  - [NPTEL: Digital Design (EE180)](https://onlinecourses.nptel.ac.in/noc25_ee180/preview)
  - [NPTEL: VLSI Design (CS155)](https://onlinecourses.nptel.ac.in/noc25_cs155/preview)
- **Research Papers:**
  - [A 32-bit ALU for high-performance embedded processors](https://ieeexplore.ieee.org/document/10968047)
  - [Design and Implementation of ALU Based on FPGA](https://ieeexplore.ieee.org/document/10940212)
  - [Design of high speed and area efficient ALU using Verilog](https://ieeexplore.ieee.org/document/9696935)

---

## How to Run

1. **Clone the Repository**
    ```sh
    git clone https://github.com/yourusername/alu32.git
    cd alu32
    ```

2. **Compile & Simulate**
    ```sh
    iverilog -o [testbench_name.vvp] [testbench_name.v]
    vvp [testbench_name.vvp]
    ```

3. **View Waveforms**
    ```sh
    gtkwave alu32.vcd
    ```

---

## License

This project is licensed under the [MIT License](LICENSE).

```
MIT License

Copyright (c) 2025 Tejas R Mallah

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED.
```

---

## Contact

- **LinkedIn:** [Tejas R Mallah](https://www.linkedin.com/posts/tejas-r-mallah-28052b283_verilog-fpga-digitaldesign-activity-7364343834392113152-s981?utm_source=share&utm_medium=member_desktop&rcm=ACoAAET0mcABoSmVvowkUz7qcSZkG2bhRVZnDQ4)
- **Email:** tejasmallah@gmail.com

## Join the Conversation!

💡 _Always open to feedback, collaboration, and exciting roles in digital hardware, FPGA, and VLSI design!_

---

```
#Verilog #FPGA #DigitalDesign #HardwareDesign #RTL #Xilinx #IcarusVerilog #ALU #EDA #NPTEL #GTKWave
```

---

