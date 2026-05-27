📌 Overview

This project implements a binary sequence detector using a Shift Register approach in Verilog HDL. The design continuously monitors a serial input stream and asserts an output signal when the target binary sequence is detected.

Rather than using an FSM (Finite State Machine), this implementation leverages a shift register to buffer incoming bits and a comparator to check for a match — resulting in a clean, hardware-efficient design.

The design is functionally verified using a custom testbench, simulated with Icarus Verilog, and analyzed via waveforms in GTKWave.



⚙️ Features



Shift register-based serial sequence detection

Comparator logic for real-time pattern matching

Modular Verilog RTL design (each block in a separate .v file)

Comprehensive testbench covering normal, edge, and overlap cases

Waveform output (.vcd) for visual debugging in GTKWave





🧠 Design Methodology

The sequence detector is built around a shift register + comparator architecture:

Serial Input ──► \[ Shift Register ] ──► \[ Comparator ] ──► Output (match detected)

&#x20;                  (N-bit buffer)          (target == register?)

How It Works



Shift Register — On every clock edge, the incoming serial bit is shifted into an N-bit register, pushing out the oldest bit.

Comparator — The current contents of the shift register are compared against the target sequence in parallel.

Output — When the shift register content matches the target, the output is asserted HIGH for that clock cycle.

Overlap Handling — Since the shift register always holds the last N bits, overlapping sequences are detected naturally without any reset logic.



This approach avoids the complexity of state encoding and is especially efficient for fixed-length sequence detection.



🗂️ Project Structure

sequence\_detector/

│

├── src/                        # RTL design files

│   ├── top\_module.v            # Top-level integration

│   ├── shift\_register.v        # N-bit serial shift register

│   ├── comparator.v            # Bitwise comparator for match detection

│   ├── counter\_module.v        # Optional counter for timing/tracking

│   ├── uart\_interface.v        # UART interface (for serial input)

│   └── display\_controller.v   # Display output controller

│

├── tb/                         # Testbench files

│   └── top\_module\_tb.v         # Functional verification testbench

│

├── docs/                       # Documentation

├── constraints/                # Constraint files (for FPGA implementation)

├── output/

│   └── wave.vcd                # Simulation waveform dump

├── sim                         # Compiled simulation binary

├── .gitignore

└── README.md



🧪 Simulation Setup

Make sure Icarus Verilog and GTKWave are installed before proceeding.

🔹 Step 1 — Compile

bashiverilog -o sim tb/top\_module\_tb.v src/\*.v

🔹 Step 2 — Run Simulation

bashvvp sim

This generates the wave.vcd waveform file in the project root.

🔹 Step 3 — View Waveform

bashgtkwave wave.vcd

Open the relevant signals (clk, serial\_in, shift\_reg, match\_out) in GTKWave to inspect behavior.



📊 Expected Output

SignalBehaviorserial\_inSerial bits applied one per clock cycleshift\_reg\[N-1:0]Updates every cycle; holds the last N input bitsmatch\_outGoes HIGH for one cycle when shift register matches target sequence



Note: Overlapping occurrences of the sequence are also detected since no reset is applied after a match.





🛠️ Tools Used

ToolPurposeVerilog HDLRTL design and testbenchIcarus VerilogCompilation and simulationGTKWaveWaveform visualization and debugging



📈 Learning Outcomes



Shift register design and serial data handling in Verilog

Parallel comparator logic for pattern matching

Modular RTL design practices

Testbench creation with edge case coverage

Waveform analysis and signal debugging in GTKWave





🚀 Future Improvements



&#x20;Parameterize sequence length (N) and target pattern for reusability

&#x20;Add support for multiple simultaneous sequence targets

&#x20;FPGA implementation and hardware testing (Xilinx / Intel)

&#x20;Integrate UART input for real-time serial stream detection

&#x20;GUI-based simulation automation using Makefile or Python scripts





👩‍💻 Author

Bhavitha

Digital Design | Verilog HDL | FPGA Enthusiast

