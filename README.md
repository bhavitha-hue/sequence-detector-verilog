# Multi-Sequence Detector with Priority Override using Verilog HDL

## Overview

This project implements a configurable **Multi-Sequence Detector** using Verilog HDL. The system continuously monitors a serial input stream and detects multiple predefined binary sequences using a shift-register-based architecture.

The design supports:

* Multiple sequence detection
* Overlapping sequence detection
* Conflict detection
* Manual priority override
* Detection counters
* FPGA-ready modular architecture

This project was developed and verified using **Icarus Verilog**, **GTKWave**, and **Visual Studio Code**.


# Features

✅ Multi-sequence detection

✅ Shift-register-based pattern matching

✅ Overlapping sequence support

✅ Conflict detection

✅ Manual priority selection

✅ Detection counters

✅ Modular Verilog design

✅ Easy FPGA integration


## Block Diagram

![Block Diagram](docs/BLOCK_DIAGRAM_SD.jpeg)

## FSM Flowchart

![FSM Flowchart](docs/FSM_SD.jpeg)

## Simulation Waveform

![Waveform](docs/WAVEFORM_SD.png)


# Architecture


                    Serial Input
                          │
                          ▼
                  Shift Register
                          │
                          ▼
                  Multi Detector
                          │
                          ▼
                 Conflict Detector
                          │
                          ▼
                 Priority Override
                          │
                          ▼
                   Counter Module
                          │
                          ▼
                    Final Output


# Project Structure
```
sequence_detector/
│
├── src/
│   ├── shift_register.v
│   ├── multi_detector.v
│   ├── conflict_detector.v
│   ├── priority_override.v
│   ├── counter_module.v
│   └── top_module.v
│
├── tb/
│   └── top_module_tb.v
│
├── docs/
│   ├── BLOCK_DIAGRAM_SD.jpeg
│   ├── FSM_SD.jpeg
│   └── WAVEFORM_SD.png
│
├── README.md
└── .gitignore
```


# Module Description

## 1. Shift Register

The shift register stores incoming serial bits and provides a sliding window for sequence comparison.

### Inputs

* clk
* reset
* data_in

### Output

* shift_reg

## 2. Multi Detector

Compares shift-register contents against predefined binary sequences.

### Functions

* Parallel sequence matching
* Multiple sequence detection
* Match vector generation

## 3. Conflict Detector

Identifies situations where multiple sequences are detected simultaneously.

### Output

* conflict


## 4. Priority Override

Allows the user to manually select which sequence should receive priority during conflicts.

### Inputs

* match_vector
* priority_select

### Output

* selected_sequence


## 5. Counter Module

Counts the number of successful detections for each sequence.

### Outputs

* seq1_count
* seq2_count
* seq3_count
* seq4_count


## 6. Top Module

Integrates all modules into a complete sequence detection system.

### Responsibilities

* Data flow management
* Conflict handling
* Output generation


# Detection Flow

1. Serial data enters the shift register.
2. Stored bits are compared with predefined sequences.
3. Matching sequences are identified.
4. Conflict detector checks for simultaneous matches.
5. Priority override resolves conflicts.
6. Detection counters are updated.
7. Final output is generated.


# Example Sequences

Example patterns that can be monitored:

Sequence 1 : 1011
Sequence 2 : 1101
Sequence 3 : 0110
Sequence 4 : 1110
The design can be extended to support additional sequences by modifying the detector logic.


# Manual Priority Override

When two or more sequences are detected simultaneously:

1. Conflict signal is asserted.
2. User selects priority through `priority_select`.
3. Selected sequence is forwarded as output.
4. Corresponding counter is updated.

This ensures deterministic behavior during multiple matches.

# Simulation Procedure

## Compile

iverilog -o sim tb/top_module_tb.v src/*.v

## Run Simulation

vvp sim

## Generate Waveform

gtkwave wave.vcd


# Signals Used

  Signal              Description                       

  clk               System clock                      
 reset              System reset                      
 data_in            Serial input stream               
 match_vector       Indicates matched sequences       
 conflict           Multiple sequence match indicator 
 priority_select    User-selected priority            
 selected_sequence  Final chosen sequence             
 seq_count          Detection count                   


# Verification

The testbench verifies:

* Normal sequence detection
* Multiple sequence detection
* Overlapping sequence detection
* Conflict generation
* Priority override operation
* Counter functionality

# Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Visual Studio Code
* Git
* GitHub


# Applications

* Communication protocol monitoring
* Pattern recognition systems
* FPGA-based controllers
* Embedded hardware verification
* Data stream analysis
* Digital signal processing systems


# Future Enhancements

* OLED/LCD display support
* Runtime configurable sequences
* FPGA deployment on Xilinx/AMD boards
* Sequence storage in memory blocks


# Results

The system successfully detects multiple binary sequences from a serial input stream while supporting overlap detection, conflict resolution, and manual priority control.

Simulation results confirm correct functionality of all modules and demonstrate reliable operation under different test scenarios.


# Author

**Bhavitha Nagavarapu**

Verilog HDL | Digital Design | FPGA Development
