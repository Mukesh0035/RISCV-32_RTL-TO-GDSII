//==============================================================================
// MEM/WB Pipeline Register
// Stores memory stage results for writeback stage
//==============================================================================

module mem_wb_reg (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        enable,
    input  logic        flush,
    
    // Input signals from memory stage
    input  logic [31:0] pc_in,
    input  logic [31:0] alu_result_in,
    input  logic [31:0] mem_data_in,
    input  logic [4:0]  rd_addr_in,
    input  logic        reg_write_in,
    input  logic [1:0]  wb_sel_in,
    
    // Output signals to writeback stage
    output logic [31:0] pc_out,
    output logic [31:0] alu_result_out,
    output logic [31:0] mem_data_out,
    output logic [4:0]  rd_addr_out,
    output logic        reg_write_out,
    output logic [1:0]  wb_sel_out
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n || flush) begin
            pc_out <= 32'b0;
            alu_result_out <= 32'b0;
            mem_data_out <= 32'b0;
            rd_addr_out <= 5'b0;
            reg_write_out <= 1'b0;
            wb_sel_out <= 2'b0;
        end else if (enable) begin
            pc_out <= pc_in;
            alu_result_out <= alu_result_in;
            mem_data_out <= mem_data_in;
            rd_addr_out <= rd_addr_in;
            reg_write_out <= reg_write_in;
            wb_sel_out <= wb_sel_in;
        end
    end

endmodule
