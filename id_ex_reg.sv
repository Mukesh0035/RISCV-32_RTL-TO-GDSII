

//==============================================================================
// ID/EX Pipeline Register
//==============================================================================

module id_ex_reg (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        enable,
    input  logic        flush,
    
    // Input signals
    input  logic [31:0] pc_in,
    input  logic [31:0] rs1_data_in,
    input  logic [31:0] rs2_data_in,
    input  logic [31:0] immediate_in,
    input  logic [4:0]  rd_addr_in,
    input  logic        reg_write_in,
    input  logic        mem_read_in,
    input  logic        mem_write_in,
    input  logic [2:0]  alu_op_in,
    input  logic [1:0]  wb_sel_in,
    input  logic        alu_src_in,
    
    // Output signals
    output logic [31:0] pc_out,
    output logic [31:0] rs1_data_out,
    output logic [31:0] rs2_data_out,
    output logic [31:0] immediate_out,
    output logic [4:0]  rd_addr_out,
    output logic        reg_write_out,
    output logic        mem_read_out,
    output logic        mem_write_out,
    output logic [2:0]  alu_op_out,
    output logic [1:0]  wb_sel_out,
    output logic        alu_src_out
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n || flush) begin
            pc_out <= 32'b0;
            rs1_data_out <= 32'b0;
            rs2_data_out <= 32'b0;
            immediate_out <= 32'b0;
            rd_addr_out <= 5'b0;
            reg_write_out <= 1'b0;
            mem_read_out <= 1'b0;
            mem_write_out <= 1'b0;
            alu_op_out <= 3'b0;
            wb_sel_out <= 2'b0;
            alu_src_out <= 1'b0;
        end else if (enable) begin
            pc_out <= pc_in;
            rs1_data_out <= rs1_data_in;
            rs2_data_out <= rs2_data_in;
            immediate_out <= immediate_in;
            rd_addr_out <= rd_addr_in;
            reg_write_out <= reg_write_in;
            mem_read_out <= mem_read_in;
            mem_write_out <= mem_write_in;
            alu_op_out <= alu_op_in;
            wb_sel_out <= wb_sel_in;
            alu_src_out <= alu_src_in;
        end
    end

endmodule
