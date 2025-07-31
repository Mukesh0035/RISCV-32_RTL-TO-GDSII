//==============================================================================
// RISC-V RV32I 5-Stage Pipelined Processor
// Module: risc_v321 (Top Level)
// Author: Generated for Industrial Synthesis
// Description: 32-bit RISC-V processor with hazard detection and forwarding
//==============================================================================

module risc_v321 (
    input  logic        clk,
    input  logic        rst_n,
    
    // Instruction Memory Interface
    output logic [31:0] imem_addr,
    input  logic [31:0] imem_data,
    output logic        imem_req,
    input  logic        imem_ready,
    
    // Data Memory Interface  
    output logic [31:0] dmem_addr,
    output logic [31:0] dmem_wdata,
    input  logic [31:0] dmem_rdata,
    output logic        dmem_we,
    output logic [3:0]  dmem_be,
    output logic        dmem_req,
    input  logic        dmem_ready,
    
    // Debug/Test Interface
    output logic [31:0] pc_current,
    output logic [31:0] reg_debug,
    output logic        pipeline_stall,
    output logic        pipeline_flush
);
      
    // Signal Declarations
    logic [31:0] immediate_id, immediate_ex, immediate_wb;
    logic [31:0] rs1_data_ex, rs2_data_ex, rs2_data_mem;
    logic [31:0] alu_result, alu_result_mem, alu_result_wb;
    logic [31:0] mem_data, mem_data_wb;
    logic [2:0]  funct3_ex, funct3_mem;
    logic [1:0]  wb_sel_ex, wb_sel_mem, wb_sel_wb;
    logic        alu_src_ex;
    logic [31:0] pc_plus_4_wb;
    logic [31:0] branch_target, jump_target;
    logic        branch_ex, jump_ex;
    
    // Pipeline Stage Signals
    logic [31:0] pc_if, pc_id, pc_ex, pc_mem, pc_wb;
    logic [31:0] instruction_if, instruction_id;
    logic [31:0] rs1_data, rs2_data;
    logic [31:0] wb_data;
    logic [4:0]  rd_addr_ex, rd_addr_mem, rd_addr_wb;
    logic        reg_write_ex, reg_write_mem, reg_write_wb;
    
    // Hazard Control Signals
    logic        hazard_stall, hazard_flush;
    logic [1:0]  forward_a, forward_b;
    logic        branch_taken, jump_taken;
    
    // Control Signals
    logic        mem_read, mem_write;
    logic [2:0]  alu_op;
    logic [1:0]  wb_sel;
    
    // Pipeline Register Enables
    logic        if_id_enable, id_ex_enable, ex_mem_enable, mem_wb_enable;
    
    // Signals between pipeline stages for registers and control
    logic        mem_read_ex, mem_write_ex;
    logic        mem_read_mem, mem_write_mem;
    logic [2:0]  alu_op_ex;

    // Assign debug outputs
    assign pc_current = pc_if;
    assign pipeline_stall = hazard_stall;
    assign pipeline_flush = hazard_flush;

    //==========================================================================
    // Pipeline Stage Instantiations
    //==========================================================================

    // Instruction Fetch Stage
    fetch_stage i_fetch (
        .clk            (clk),
        .rst_n          (rst_n),
        .stall          (hazard_stall),
        .flush          (hazard_flush),
        .branch_taken   (branch_taken),
        .jump_taken     (jump_taken),
        .branch_target  (branch_target),
        .jump_target    (jump_target),
        .pc_out         (pc_if),
        .instruction    (instruction_if),
        .imem_addr      (imem_addr),
        .imem_data      (imem_data),
        .imem_req       (imem_req),
        .imem_ready     (imem_ready)
    );

    // IF/ID Pipeline Register
    if_id_reg i_if_id_reg (
        .clk            (clk),
        .rst_n          (rst_n),
        .enable         (if_id_enable),
        .flush          (hazard_flush),
        .pc_in          (pc_if),
        .instruction_in (instruction_if),
        .pc_out         (pc_id),
        .instruction_out(instruction_id)
    );

    // Instruction Decode Stage
    decode_stage i_decode (
        .clk            (clk),
        .rst_n          (rst_n),
        .pc_in          (pc_id),
        .instruction    (instruction_id),
        .reg_write_wb   (reg_write_wb),
        .rd_addr_wb     (rd_addr_wb),
        .wb_data        (wb_data),
        .rs1_data       (rs1_data),
        .rs2_data       (rs2_data),
        .pc_out         (pc_ex),
        .rd_addr        (rd_addr_ex),
        .reg_write      (reg_write_ex),
        .mem_read       (mem_read),
        .mem_write      (mem_write),
        .alu_op         (alu_op),
        .wb_sel         (wb_sel),
        .reg_debug      (reg_debug)
    );

    // ID/EX Pipeline Register  
    id_ex_reg i_id_ex_reg (
        .clk            (clk),
        .rst_n          (rst_n),
        .enable         (id_ex_enable),
        .flush          (hazard_flush),
        .pc_in          (pc_ex),
        .rs1_data_in    (rs1_data),
        .rs2_data_in    (rs2_data),
        .rd_addr_in     (rd_addr_ex),
        .reg_write_in   (reg_write_ex),
        .mem_read_in    (mem_read),
        .mem_write_in   (mem_write),
        .alu_op_in      (alu_op),
        .wb_sel_in      (wb_sel),
        // Outputs registered for next stage
        .pc_out         (pc_ex), // careful: pc_ex forwarded to execute stage
        .rs1_data_out   (rs1_data_ex),
        .rs2_data_out   (rs2_data_ex),
        .rd_addr_out    (rd_addr_ex),
        .reg_write_out  (reg_write_ex),
        .mem_read_out   (mem_read_ex),
        .mem_write_out  (mem_write_ex),
        .alu_op_out     (alu_op_ex),
        .wb_sel_out     (wb_sel_ex)
    );

    // Execute Stage
    execute_stage i_execute (
        .clk                (clk),
        .rst_n              (rst_n),
        .pc_in              (pc_ex),
        .rs1_data           (rs1_data_ex),
        .rs2_data           (rs2_data_ex),
        .immediate          (immediate_ex),
        .alu_op             (alu_op_ex),
        .alu_src            (alu_src_ex),
        .branch             (branch_ex),
        .jump               (jump_ex),
        .funct3             (funct3_ex),
        .forward_a          (forward_a),
        .forward_b          (forward_b),
        .alu_result_mem     (alu_result_mem),
        .wb_data            (wb_data),
        .alu_result         (alu_result),
        .branch_target      (branch_target),
        .jump_target        (jump_target),
        .branch_taken       (branch_taken),
        .jump_taken         (jump_taken),
        .rs2_data_forwarded (rs2_data_ex)
    );

    // EX/MEM Pipeline Register
    ex_mem_reg i_ex_mem_reg (
        .clk            (clk),
        .rst_n          (rst_n),
        .enable         (ex_mem_enable),
        .flush          (hazard_flush),
        .pc_in          (pc_ex),
        .alu_result_in  (alu_result),
        .rs2_data_in    (rs2_data_ex),
        .rd_addr_in     (rd_addr_ex),
        .reg_write_in   (reg_write_ex),
        .mem_read_in    (mem_read_ex),
        .mem_write_in   (mem_write_ex),
        .wb_sel_in      (wb_sel_ex),
        .funct3_in      (funct3_ex),
        .pc_out         (pc_mem),
        .alu_result_out (alu_result_mem),
        .rs2_data_out   (rs2_data_mem),
        .rd_addr_out    (rd_addr_mem),
        .reg_write_out  (reg_write_mem),
        .mem_read_out   (mem_read_mem),
        .mem_write_out  (mem_write_mem),
        .wb_sel_out     (wb_sel_mem),
        .funct3_out     (funct3_mem)
    );

    /// Memory Access Stage
    memory_stage i_memory (
        .clk            (clk),
        .rst_n          (rst_n),
        .alu_result     (alu_result_mem),
        .rs2_data       (rs2_data_mem),
        .mem_read       (mem_read_mem),
        .mem_write      (mem_write_mem),
        .funct3         (funct3_mem),
        .dmem_addr      (dmem_addr),
        .dmem_wdata     (dmem_wdata),
        .dmem_rdata     (dmem_rdata),
        .dmem_we        (dmem_we),
        .dmem_be        (dmem_be),
        .dmem_req       (dmem_req),
        .dmem_ready     (dmem_ready),
        .mem_data       (mem_data)
    );

    // Hazard Detection and Forwarding Unit
    hazard_unit i_hazard (
        .clk            (clk),
        .rst_n          (rst_n),
        .rs1_addr_id    (instruction_id[19:15]),
        .rs2_addr_id    (instruction_id[24:20]),
        .rd_addr_ex     (rd_addr_ex),
        .rd_addr_mem    (rd_addr_mem), 
        .rd_addr_wb     (rd_addr_wb),
        .reg_write_ex   (reg_write_ex),
        .reg_write_mem  (reg_write_mem),
        .reg_write_wb   (reg_write_wb),
        .mem_read_ex    (mem_read_ex),
        .branch_taken   (branch_taken),
        .jump_taken     (jump_taken),
        .stall          (hazard_stall),
        .flush          (hazard_flush),
        .forward_a      (forward_a),
        .forward_b      (forward_b),
        .if_id_enable   (if_id_enable),
        .id_ex_enable   (id_ex_enable),
        .ex_mem_enable  (ex_mem_enable),
        .mem_wb_enable  (mem_wb_enable)
    );

    // Writeback Stage
   // writeback_stage i_writeback (
     //   .pc_plus_4      (pc_wb + 32'd4),
       // .alu_result     (alu_result_wb),
       // .mem_data       (mem_data_wb),
       // .immediate      (immediate_wb),
       // .wb_sel         (wb_sel_wb),
       // .wb_data        (wb_data)
  //  );

endmodule
