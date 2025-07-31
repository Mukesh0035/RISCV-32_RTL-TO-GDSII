# Set the name of your design
set ::env(DESIGN_NAME) riscv32

# Where your source files live
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/*.v]

# Top module
set ::env(TOP_MODULE) riscv32

# Clock period (e.g., 25ns = 40MHz)
set ::env(CLOCK_PERIOD) "25"

# Clock signal name in your RTL
set ::env(CLOCK_PORT) "clk"

# I/O constraints (optional, but useful)
#unset ::env(FP_PIN_ORDER_CFG) 

# Placement
set ::env(DIE_AREA) "0 0 100 100"
set ::env(CORE_AREA) "10 10 90 90"

# Power and ground nets
set ::env(VDD_NETS) "vdd"
set ::env(GND_NETS) "gnd"
