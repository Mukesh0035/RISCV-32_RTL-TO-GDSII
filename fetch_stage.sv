//==============================================================================
// RISC-V Instruction Fetch Stage
// Handles PC generation, branch/jump target calculation, and instruction fetch
//==============================================================================

module fetch_stage (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        stall,
    input  logic        flush,
    input  logic        branch_taken,
    input  logic        jump_taken, 
    input  logic [31:0] branch_target,
    input  logic [31:0] jump_target,
    
    output logic [31:0] pc_out,
    output logic [31:0] instruction,
    
    // Memory Interface
    output logic [31:0] imem_addr,
    input  logic [31:0] imem_data,
    output logic        imem_req,
    input  logic        imem_ready
);

    logic [31:0] pc_reg, pc_next;
    logic [31:0] pc_plus_4;
    
    // PC Register
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc_reg <= 32'h0000_0100; // Start address
        end else if (!stall && imem_ready) begin
            pc_reg <= pc_next;
        end
    end
    
    // PC + 4 calculation
    assign pc_plus_4 = pc_reg + 32'd4;
    
    // Next PC selection with priority: Jump > Branch > Sequential
    always_comb begin
        if (jump_taken) begin
            pc_next = jump_target & 32'hFFFF_FFFE; // Clear LSB for alignment
        end else if (branch_taken) begin
            pc_next = branch_target;
        end else begin
            pc_next = pc_plus_4;
        end
    end
    
    // Memory interface
    assign imem_addr = pc_reg;
    assign imem_req = !stall;
    assign instruction = flush ? 32'h0000_0013 : imem_data; // NOP on flush
    assign pc_out = pc_reg;

endmodule
