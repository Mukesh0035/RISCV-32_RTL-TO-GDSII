//==============================================================================
// RISC-V Writeback Stage
// Selects the correct data to write back to register file
//==============================================================================

module writeback_stage (
    input  logic [31:0] pc_plus_4,
    input  logic [31:0] alu_result,
    input  logic [31:0] mem_data,
    input  logic [31:0] immediate,
    input  logic [1:0]  wb_sel,
    
    output logic [31:0] wb_data
);

    // Writeback source selection
    localparam WB_ALU  = 2'b00;
    localparam WB_MEM  = 2'b01;
    localparam WB_PC4  = 2'b10;
    localparam WB_IMM  = 2'b11;
    
    always_comb begin
        case (wb_sel)
            WB_ALU:  wb_data = alu_result;
            WB_MEM:  wb_data = mem_data;
            WB_PC4:  wb_data = pc_plus_4;
            WB_IMM:  wb_data = immediate;
            default: wb_data = alu_result;
        endcase
    end

endmodule
