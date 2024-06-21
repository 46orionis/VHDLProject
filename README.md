# 16-bit Processor Design in VHDL

## Project Overview

This repository contains the VHDL implementation of a 16-bit processor, designed following a Von Neumann architecture. The project was developed collaboratively by our team to explore the intricacies of processor design and VHDL programming.

## Architecture

![Processor Architecture](https://github.com/46orionis/VHDLProject/assets/65911052/62397be2-24e1-456e-9705-ff329bc639c1)

### Description of the Architecture!



At the highest level, our memory is external to the CPU. The CPU itself is divided into two main parts: the datapath and the control unit, which communicate through control signals.

- The **datapath** sends the opcode (5-bit) and a control signal M (1-bit) to the control unit.
- The **control unit** processes the opcode, translates it into micro-instructions, and outputs control signals to the datapath.
- The **datapath** executes the micro-instructions and stores the results in memory.

### Datapath
![Screenshot 2024-06-21 231229](https://github.com/46orionis/VHDLProject/assets/65911052/98189a9b-b2a2-4c8b-8f53-d0d63f27da0c)

The high-level component "datapath" includes all our registers, the ALU (Arithmetic Logic Unit), and the register file. The datapath consists of multiple components:

- **PC (Program Counter)**: A counter that points to the address of the instruction to be executed, which is then stored in the IR (Instruction Register).
- **IR (Instruction Register)**
- **DR (Data Register)**
- **AR (Address Register)**
- **RF (Register File)**
- **Flag Register**
- **Multiplexers**

### Control Unit

![Screenshot 2024-06-21 231245](https://github.com/46orionis/VHDLProject/assets/65911052/10c65d68-fd67-426d-baf9-7bb8d2ea4dcc)

The high-level component "Control Unit" contains various components that ensure the proper functioning of the microprocessor by outputting the necessary micro-instructions.

- The control unit takes the opcode as input and translates it into control signals.
- The opcode is processed by a mapper and converted into micro-instructions based on the MPROM instructions.
- These control signals are then sent to various components of the datapath to execute the instructions.

### Memory (RAM/ROM 128 words)

Our memory is a 128-word memory, shared between data (the first 64 words) and instructions (the last 64 words), with each memory space being 16 bits.

## Instruction Set

We have a comprehensive instruction set, including:

- **Arithmetic operations**: Addition, subtraction, multiplication, and division.
- **Logical operations**: AND, OR, NOR, XNOR, NAND, and XOR.
- **Shift operations**: SLL (Shift Left Logical), SLR (Shift Right Logical), ROR (Rotate Right), and ROL (Rotate Left).
- **Comparison operations**: Less than, equal to.
- **Load and store instructions**.

<!--# Components

### ALU (Arithmetic Logic Unit)

The ALU performs arithmetic and logical operations. It supports operations such as addition, subtraction, AND, OR, and XOR.

```vhdl
-- ALU.vhd
-- VHDL code for the ALU
-->
## Contributors
Mohammed BARROUCH <br>
Nilam EL AMRANI <br>
