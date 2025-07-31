//==============================================================================
// RISC-V Arithmetic Logic Unit (ALU)
// Supports all RV32I arithmetic and logic operations
//==============================================================================

module alu (
    input  logic [31:0] operand_a,
    input  logic [31:0] operand_b,
    input  logic [3:0]  alu_control,
    
    output logic [31:0] alu_result,
    output logic        zero_flag,
    output logic        negative_flag,
    output logic        overflow_flag,
    output logic        carry_flag
);

    // ALU Control Encoding
    localparam ALU_ADD  = 4'b0000;
    localparam ALU_SUB  = 4'b0001;
    localparam ALU_AND  = 4'b0010;
    localparam ALU_OR   = 4'b0011;
    localparam ALU_XOR  = 4'b0100;
    localparam ALU_SLL  = 4'b0101;
    localparam ALU_SRL  = 4'b0110;
    localparam ALU_SRA  = 4'b0111;
    localparam ALU_SLT  = 4'b1000;
    localparam ALU_SLTU = 4'b1001;
    localparam ALU_BEQ  = 4'b1010;
    localparam ALU_BNE  = 4'b1011;
    localparam ALU_BLT  = 4'b1100;
    localparam ALU_BGE  = 4'b1101;
    localparam ALU_BLTU = 4'b1110;
    localparam ALU_BGEU = 4'b1111;
    
    logic [32:0] add_result, sub_result;
    logic        less_than_signed, less_than_unsigned;
    
    // Extended arithmetic for overflow/carry detection
    assign add_result = {1'b0, operand_a} + {1'b0, operand_b};
    assign sub_result = {1'b0, operand_a} - {1'b0, operand_b};
    
    // Comparison operations
    assign less_than_signed   = $signed(operand_a) < $signed(operand_b);
    assign less_than_unsigned = operand_a < operand_b;
    
    // Main ALU operation
    always_comb begin
        case (alu_control)
            ALU_ADD:  alu_result = add_result[31:0];
            ALU_SUB:  alu_result = sub_result[31:0];
            ALU_AND:  alu_result = operand_a & operand_b;
            ALU_OR:   alu_result = operand_a | operand_b;
            ALU_XOR:  alu_result = operand_a ^ operand_b;
            ALU_SLL:  alu_result = operand_a << operand_b[4:0];
            ALU_SRL:  alu_result = operand_a >> operand_b[4:0];
            ALU_SRA:  alu_result = $signed(operand_a) >>> operand_b[4:0];
            ALU_SLT:  alu_result = {31'b0, less_than_signed};
            ALU_SLTU: alu_result = {31'b0, less_than_unsigned};
            ALU_BEQ:  alu_result = {31'b0, operand_a == operand_b};
            ALU_BNE:  alu_result = {31'b0, operand_a != operand_b};
            ALU_BLT:  alu_result = {31'b0, less_than_signed};
            ALU_BGE:  alu_result = {31'b0, !less_than_signed};
            ALU_BLTU: alu_result = {31'b0, less_than_unsigned};
            ALU_BGEU: alu_result = {31'b0, !less_than_unsigned};
            default:  alu_result = 32'b0;
        endcase
    end
    
    // Flag generation
    assign zero_flag     = (alu_result == 32'b0);
    assign negative_flag = alu_result[31];
    assign carry_flag    = (alu_control == ALU_ADD) ? add_result[32] : 
                          (alu_control == ALU_SUB) ? !sub_result[32] : 1'b0;
    assign overflow_flag = (alu_control == ALU_ADD) ? 
                          (operand_a[31] == operand_b[31]) && (alu_result[31] != operand_a[31]) :
                          (alu_control == ALU_SUB) ?
                          (operand_a[31] != operand_b[31]) && (alu_result[31] != operand_a[31]) : 1'b0;

endmodule
