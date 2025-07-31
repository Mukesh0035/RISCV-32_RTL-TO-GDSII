// Code your design here
//==============================================================================
// RISC-V Instruction Decode Stage  
// Handles instruction decoding, register file access, and control signal generation
//==============================================================================

module decode_stage (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [31:0] pc_in,
    input  logic [31:0] instruction,
    
    // Writeback signals
    input  logic        reg_write_wb,
    input  logic [4:0]  rd_addr_wb,
    input  logic [31:0] wb_data,
    
    // Outputs to execute stage
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data,
    output logic [31:0] pc_out,
    output logic [4:0]  rd_addr,
    output logic        reg_write,
    output logic        mem_read,
    output logic        mem_write,
    output logic [2:0]  alu_op,
    output logic [1:0]  wb_sel,
    
    // Debug interface
    output logic [31:0] reg_debug
);

    // Instruction fields
    logic [6:0]  opcode;
    logic [4:0]  rs1_addr, rs2_addr;
    logic [2:0]  funct3;
    logic [6:0]  funct7;
    logic [31:0] immediate;
    
    // Control signals
    logic        alu_src, reg_dst;
    logic        branch, jump;
    logic [1:0]  reg_write_sel;
    
    // Extract instruction fields
    assign opcode   = instruction[6:0];
    assign rd_addr  = instruction[11:7];
    assign funct3   = instruction[14:12];
    assign rs1_addr = instruction[19:15];
    assign rs2_addr = instruction[24:20];
    assign funct7   = instruction[31:25];
    
    assign pc_out = pc_in;
    
//    Register File Instantiation
//     register_file i_regfile (
//         .clk        (clk),
//         .rst_n      (rst_n),
//         .rs1_addr   (rs1_addr),
//         .rs2_addr   (rs2_addr),
//         .rd_addr    (rd_addr_wb),
//         .rd_data    (wb_data),
//         .reg_write  (reg_write_wb),
//         .rs1_data   (rs1_data),
//         .rs2_data   (rs2_data),
//         .reg_debug  (reg_debug)
//     );
    
//     // Immediate Generation
//     immediate_gen i_imm_gen (
//         .instruction(instruction),
//         .immediate  (immediate)
//     );
    
    // Main Control Unit
//     control_unit i_control (
//         .opcode     (opcode),
//         .funct3     (funct3),
//         .funct7     (funct7),
//         .reg_write  (reg_write),
//         .mem_read   (mem_read),
//         .mem_write  (mem_write),
//         .alu_src    (alu_src),
//         .alu_op     (alu_op),
//         .wb_sel     (wb_sel),
//         .branch     (branch),
//         .jump       (jump)
//     );

endmodule
