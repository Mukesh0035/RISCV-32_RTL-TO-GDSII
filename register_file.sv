//==============================================================================
// RISC-V Register File
// 32 x 32-bit registers with x0 hardwired to zero
// Supports simultaneous 2 reads and 1 write
//==============================================================================

module register_file (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [4:0]  rs1_addr,
    input  logic [4:0]  rs2_addr,
    input  logic [4:0]  rd_addr,
    input  logic [31:0] rd_data,
    input  logic        reg_write,
    
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data,
    output logic [31:0] reg_debug [31:0]
);

    // Register array (x1-x31, x0 is handled separately)
    logic [31:0] registers [31:1];
    
    // Synchronous write
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int i = 1; i < 32; i++) begin
                registers[i] <= 32'b0;
            end
        end else if (reg_write && (rd_addr != 5'b0)) begin
            registers[rd_addr] <= rd_data;
        end
    end
    
    // Asynchronous read with x0 hardwired to zero
    assign rs1_data = (rs1_addr == 5'b0) ? 32'b0 : registers[rs1_addr];
    assign rs2_data = (rs2_addr == 5'b0) ? 32'b0 : registers[rs2_addr];
    
    // Debug interface - expose all registers
    assign reg_debug[0] = 32'b0; // x0 is always zero
    genvar i;
    generate
        for (i = 1; i < 32; i++) begin : gen_debug
            assign reg_debug[i] = registers[i];
        end
    endgenerate

endmodule
