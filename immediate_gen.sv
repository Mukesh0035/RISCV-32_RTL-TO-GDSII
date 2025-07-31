//==============================================================================
// RISC-V Immediate Generator
// Extracts and sign-extends immediate values from instructions
//==============================================================================

module immediate_gen (
    input  logic [31:0] instruction,
    output logic [31:0] immediate
);

    logic [6:0] opcode;
    
    assign opcode = instruction[6:0];
    
    always_comb begin
        case (opcode)
            // I-type instructions (arithmetic, loads, JALR)
            7'b0010011, 7'b0000011, 7'b1100111: begin
                immediate = {{21{instruction[31]}}, instruction[30:20]};
            end
            
            // S-type instructions (stores)
            7'b0100011: begin
                immediate = {{21{instruction[31]}}, instruction[30:25], instruction[11:7]};
            end
            
            // B-type instructions (branches)
            7'b1100011: begin
                immediate = {{20{instruction[31]}}, instruction[7], instruction[30:25], 
                           instruction[11:8], 1'b0};
            end
            
            // U-type instructions (LUI, AUIPC)
            7'b0110111, 7'b0010111: begin
                immediate = {instruction[31:12], 12'b0};
            end
            
            // J-type instructions (JAL)
            7'b1101111: begin
                immediate = {{12{instruction[31]}}, instruction[19:12], instruction[20], 
                           instruction[30:21], 1'b0};
            end
            
            default: begin
                immediate = 32'b0;
            end
        endcase
    end

endmodule
