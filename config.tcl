set ::env(DESIGN_NAME) "risc_v321"

# List all source files (ensure file names match exactly)
set ::env(VERILOG_FILES) [list \
    $::env(DESIGN_DIR)/risc_v_top.sv \
    $::env(DESIGN_DIR)/fetch_stage.sv \
    $::env(DESIGN_DIR)/if_id_reg.sv \
    $::env(DESIGN_DIR)/decode_stage.sv \
    $::env(DESIGN_DIR)/id_ex_reg.sv \
    $::env(DESIGN_DIR)/execute_stage.sv \
    $::env(DESIGN_DIR)/ex_mem_reg.sv \
    $::env(DESIGN_DIR)/memory_stage.sv \
    $::env(DESIGN_DIR)/hazard_unit.sv \
    $::env(DESIGN_DIR)/writeback_stage.sv \
]

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "10.0"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 60 60"
set ::env(CORE_AREA) "5 5 55 55"

set ::env(RUN_LINTER) 0









#set ::env(DESIGN_NAME) "risc_v_top"

# Read all SystemVerilog files from the current directory
#set ::env(VERILOG_FILES) [glob ./riscv/*.sv]
#set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/risc_v_top.sv]

# Clock configuration
#set ::env(CLOCK_PORT) "clk"
#set ::env(CLOCK_PERIOD) "10.0" ;# 100 MHz

# Technology setup
#set ::env(LIB_SYNTH) "sky130_fd_sc_hd__tt_025C_1v80.lib"
#set ::env(LIB_FASTEST) "sky130_fd_sc_hd__ff_100C_1v65.lib"
#set ::env(LIB_SLOWEST) "sky130_fd_sc_hd__ss_100C_1v60.lib"
#set ::env(LIB_TYPICAL) "sky130_fd_sc_hd__tt_025C_1v80.lib"

# Floorplan settings
#set ::env(FP_CORE_UTIL) 50
#set ::env(FP_ASPECT_RATIO) 1.0
#set ::env(FP_CORE_MARGIN) 10

# Placement
#set ::env(PL_TARGET_DENSITY) 0.55

# Clock tree synthesis
#set ::env(CLOCK_TREE_SYNTH) 1
#set ::env(CLOCK_BUFFER_FANOUT) 10

# Routing
#set ::env(ROUTE_CLK_NET) 1

# Power grid
#set ::env(FP_PDN_VPITCH) 50
#set ::env(FP_PDN_HPITCH) 50

# LVS/DRC
#set ::env(RUN_LVS) 1
#set ::env(RUN_ANTENNA_CHECK) 1

# Output paths
#set ::env(GDS_OUTPUT) "results/final/gds/${::env(DESIGN_NAME)}.gds"
#set ::env(VERILOG_OUTPUT) "results/final/verilog/${::env(DESIGN_NAME)}.v"

# PDK and standard cells
#set ::env(PDK) "sky130A"
#set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"
