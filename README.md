# RISC-V 5-Stage Pipelined Processor  
### RTL → GDSII Flow with OpenLane

This repository contains a **Verilog implementation of a 5-stage pipelined RISC-V RV32I core** and the configuration files needed to harden it into silicon using the **OpenLane ASIC flow** (SkyWater sky130 PDK). The classic five pipeline stages are:

1. **Instruction Fetch (IF)**  
2. **Instruction Decode (ID)**  
3. **Execute (EX)**  
4. **Memory Access (MEM)**  
5. **Write Back (WB)**  

OpenLane orchestrates all physical-design steps—synthesis, floor-planning, placement, CTS, routing, sign-off—by integrating Yosys, OpenROAD, Magic, KLayout, Netgen and more.

## 📁 Directory Tree
```text
riscv-pipeline/
├── src/               # Verilog RTL
├── openlane/          # OpenLane design configs
│   └── riscv_core/    # Flow + constraints for this core
├── images/            # Generated figures (e.g., layout.png)
├── scripts/           # Helper scripts
└── README.md          # You are here
```

## 🚀 Quick-Start ( Ubuntu 20.04/22.04/24.04 )

### 1 · Install system packages
```bash
sudo apt update && sudo apt install -y \
  build-essential clang bison flex \
  libreadline-dev gawk tcl-dev libffi-dev \
  git mercurial graphviz xdot pkg-config \
  python3 python3-pip libboost-system-dev \
  libboost-python-dev libboost-filesystem-dev \
  zlib1g-dev cmake
```

### 2 · Clone & build OpenLane
```bash
git clone https://github.com/The-OpenROAD-Project/OpenLane.git
cd OpenLane
make                     # pulls docker image & builds environment
```
> **Note:** OpenLane runs entirely inside Docker. Make sure Docker is installed and the current user is in the `docker` group (see Docker’s post-install guide).

### 3 · Clone this repository
```bash
git clone https://github.com//riscv-pipeline.git
cd riscv-pipeline
```

### 4 · Install the Sky130 PDK (first-time only)
```bash
export OPENLANE_ROOT=/abs/path/to/OpenLane
export PDK_ROOT=/abs/path/to/pdks

cd $OPENLANE_ROOT
make pdk SKY130           # downloads and builds the full sky130A PDK
```

## 🔁 Running RTL → GDSII

1. **Enter the design directory**
   ```bash
   cd OpenLane/designs/riscv32
   ```

2. **Launch the OpenLane interactive shell**
   ```bash
   $OPENLANE_ROOT/scripts/flow.tcl -interactive
   ```

3. **Prepare and run the flow**
   ```
   prep -design . -overwrite
   run_flow
   ```
   The flow executes: _synthesis → floor-planning → placement → CTS → routing → DRC/LVS → GDSII_.

Execution logs and all intermediate artifacts are written to `runs//`.

## 📂 Key Outputs
After a successful run:
```text
runs//results/final/
├── layout.gds          # Final GDSII
├── layout.def          # Final DEF
├── layout.lef          # Abstract LEF
├── layout.v            # Synthesized netlist
├── riscv_core.sdc      # Final timing constraints
└── ...                 # SPEF, SDF, reports, logs
```

## 📸 Viewing the Final Layout

| Tool | Command | Export image |
|------|---------|--------------|
| **Magic** | `magic -T sky130A.tech layout.gds` | File → Write EPS, or screenshot |
| **KLayout** | `klayout layout.gds` | File → Save Picture / Export Image |

Save the snapshot as `images/layout.png`.

To embed the picture in this README:
```markdown
![Final layout](images/layout.png)
```

## 📘 References
* **OpenLane** –   
* **Sky130 PDK** –   
* **OpenROAD Project** – 

## 🛠️ License
Distributed under the MIT License. See `LICENSE` file for details.
