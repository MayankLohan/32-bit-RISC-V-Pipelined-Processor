# 32-bit-RISC-V-Pipelined-Processor
A 32-bit 5-stage pipelined RISC-V processor implemented in Verilog HDL with instruction fetch, decode, execute, memory, write-back stages, and data forwarding for hazard resolution.
# 32-bit 5-Stage Pipelined RISC-V Processor

A 32-bit RISC-V pipelined processor designed and implemented in **Verilog HDL**. The processor follows the standard **5-stage pipeline architecture** and supports multiple RISC-V instruction formats with a modular datapath and control unit.

The design was developed in **Vivado 2018.3** and verified through behavioral simulation using custom testbenches.

---

## Features

- 32-bit RISC-V processor
- Five-stage pipelined architecture
  - Instruction Fetch (IF)
  - Instruction Decode (ID)
  - Execute (EX)
  - Memory Access (MEM)
  - Write Back (WB)
- Modular RTL design
- Register File
- ALU
- Main Decoder
- ALU Decoder
- Sign Extension Unit
- Program Counter
- Instruction Memory
- Data Memory
- Branch Address Generation
- Pipeline Registers
- Data Forwarding Unit (Hazard Resolution)
- Behavioral Simulation using Vivado

---

## Supported Instruction Types

### R-Type

- ADD
- SUB
- AND
- OR
- SLT

### I-Type

- ADDI
- LW

### S-Type

- SW

### B-Type

- BEQ

---

## Processor Architecture

```
                +----------------+
                | Instruction    |
                | Memory         |
                +-------+--------+
                        |
                        v
               +------------------+
               | IF / ID Register |
               +------------------+
                        |
                        v
        +-------------------------------+
        | Register File + Control Unit  |
        +-------------------------------+
                        |
                        v
               +------------------+
               | ID / EX Register |
               +------------------+
                        |
                        v
             +----------------------+
             | ALU + Branch Adder   |
             +----------------------+
                        |
                        v
               +------------------+
               | EX / MEM Register|
               +------------------+
                        |
                        v
                 +---------------+
                 | Data Memory   |
                 +---------------+
                        |
                        v
               +------------------+
               | MEM / WB Register|
               +------------------+
                        |
                        v
                 Register File
```

---

## Pipeline Stages

### Instruction Fetch (IF)

- Program Counter
- PC + 4 generation
- Instruction Memory
- Branch PC selection

### Instruction Decode (ID)

- Register File
- Main Decoder
- ALU Decoder
- Immediate Generator
- Control Signal Generation

### Execute (EX)

- ALU Operations
- Branch Address Calculation
- Operand Selection
- Forwarding Unit

### Memory (MEM)

- Data Memory Read
- Data Memory Write

### Write Back (WB)

- Result Selection
- Register File Write Back

---

## ALU Operations

| ALU Control | Operation |
|-------------|-----------|
|000|ADD|
|001|SUB|
|010|AND|
|011|OR|
|101|SLT|

---

## Forwarding Unit

To reduce data hazards, a forwarding unit has been implemented.

Forwarding paths include:

- MEM → EX
- WB → EX

Forwarding decisions are generated using:

- Source Registers (RS1, RS2)
- Destination Registers (RD)
- Register Write Enable signals

---

## Project Structure

```
top_pipeline.v

├── Fetch Stage
│   ├── fetch_cycle.v
│   ├── pc_counter.v
│   ├── instruction_memory.v
│   ├── pc_adder.v
│   └── mux.v
│
├── Decode Stage
│   ├── decode_cycle.v
│   ├── register_file.v
│   ├── control_unit.v
│   ├── main_decoder.v
│   ├── alu_decoder.v
│   └── sign_extend.v
│
├── Execute Stage
│   ├── execute_cycle.v
│   ├── alu.v
│   ├── mux_3x1.v
│   └── hazard_block.v
│
├── Memory Stage
│   ├── memory_cycle.v
│   └── data_memory.v
│
├── Write Back Stage
│   └── writeback_cycle.v
│
├── Testbench
│   └── pipeline_tb.v
│
└── Program
    └── memfile.hex
```

---

## Simulation

The processor was verified using **Vivado Behavioral Simulation**.

Simulation includes:

- Instruction Fetch Verification
- Pipeline Register Verification
- Register Write-back
- ALU Operations
- Memory Access
- Forwarding Verification

Waveforms were analyzed to validate each pipeline stage.

---

## Tools Used

- Verilog HDL
- Xilinx Vivado 2018.3
- Vivado Simulator

---

## Current Status

### Implemented

- 5-stage Pipeline
- RISC-V Datapath
- Register File
- Control Unit
- ALU
- Instruction Memory
- Data Memory
- Immediate Generator
- Forwarding Unit
- Behavioral Simulation

### Under Development

- Load-use Hazard Stall Unit
- Branch Flush Logic
- Additional RISC-V Instructions
- Jump Instructions (JAL/JALR)
- Multiply Instruction
- Branch Prediction

---

## Learning Outcomes

This project provided practical experience with:

- RTL Design
- Verilog HDL
- Processor Architecture
- Pipeline Design
- Data Hazard Resolution
- Computer Architecture
- Functional Verification
- RTL Debugging
- Vivado Simulation
- Waveform Analysis

---

## Author

**Mayank Lohan**

Electronics and Communication Engineering

NIT Rourkela
