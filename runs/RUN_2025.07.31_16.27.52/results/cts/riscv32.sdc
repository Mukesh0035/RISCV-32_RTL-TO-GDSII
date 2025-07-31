###############################################################################
# Created by write_sdc
# Thu Jul 31 16:28:38 2025
###############################################################################
current_design riscv32
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 25.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R0[0]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R0[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R0[2]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R0[3]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R1[0]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R1[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R1[2]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R1[3]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R2[0]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R2[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R2[2]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R2[3]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R3[0]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R3[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R3[2]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {R3[3]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {halt}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[0]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[2]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[3]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[4]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[5]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[6]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {instr[7]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc[0]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc[1]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc[2]}]
set_output_delay 5.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pc[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {halt}]
set_load -pin_load 0.0334 [get_ports {R0[3]}]
set_load -pin_load 0.0334 [get_ports {R0[2]}]
set_load -pin_load 0.0334 [get_ports {R0[1]}]
set_load -pin_load 0.0334 [get_ports {R0[0]}]
set_load -pin_load 0.0334 [get_ports {R1[3]}]
set_load -pin_load 0.0334 [get_ports {R1[2]}]
set_load -pin_load 0.0334 [get_ports {R1[1]}]
set_load -pin_load 0.0334 [get_ports {R1[0]}]
set_load -pin_load 0.0334 [get_ports {R2[3]}]
set_load -pin_load 0.0334 [get_ports {R2[2]}]
set_load -pin_load 0.0334 [get_ports {R2[1]}]
set_load -pin_load 0.0334 [get_ports {R2[0]}]
set_load -pin_load 0.0334 [get_ports {R3[3]}]
set_load -pin_load 0.0334 [get_ports {R3[2]}]
set_load -pin_load 0.0334 [get_ports {R3[1]}]
set_load -pin_load 0.0334 [get_ports {R3[0]}]
set_load -pin_load 0.0334 [get_ports {instr[7]}]
set_load -pin_load 0.0334 [get_ports {instr[6]}]
set_load -pin_load 0.0334 [get_ports {instr[5]}]
set_load -pin_load 0.0334 [get_ports {instr[4]}]
set_load -pin_load 0.0334 [get_ports {instr[3]}]
set_load -pin_load 0.0334 [get_ports {instr[2]}]
set_load -pin_load 0.0334 [get_ports {instr[1]}]
set_load -pin_load 0.0334 [get_ports {instr[0]}]
set_load -pin_load 0.0334 [get_ports {pc[3]}]
set_load -pin_load 0.0334 [get_ports {pc[2]}]
set_load -pin_load 0.0334 [get_ports {pc[1]}]
set_load -pin_load 0.0334 [get_ports {pc[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
