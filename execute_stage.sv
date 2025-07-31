//==============================================================================
// RISC-V Execute Stage
// Handles ALU ops, branch/jump logic, and data forwarding
//==============================================================================

module execute_stage (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [31:0] pc_in,
    input  logic [31:0] rs1_data,
    input  logic [31:0] rs2_data,
    input  logic [31:0] immediate,
    input  logic [2:0]  alu_op,
    input  logic        alu_src,
    input  logic        branch,
    input  logic        jump,
    input  logic [2:0]  funct3,
    input  logic [6:0]  funct7,
    
    // Forwarding inputs
    input  logic [1:0]  forward_a,
    input  logic [1:0]  forward_b,
    input  logic [31:0] alu_result_mem,
    input  logic [31:0] wb_data,
    
    // Outputs
    output logic [31:0] alu_result,
    output logic [31:0] branch_target,
    output logic [31:0] jump_target,
    output logic        branch_taken,
    output logic        jump_taken,
    output logic [31:0] rs2_data_forwarded
);

    // Internal signals for forwarding
    logic [31:0] forwarded_rs1, forwarded_rs2;
    logic [3:0]  alu_control;
    logic        zero_flag, negative_flag, overflow_flag, carry_flag;
    
    //--------------------------------------------------------------------------
    // Data Forwarding Logic
    //--------------------------------------------------------------------------
    always_comb begin
        case (forward_a)
            2'b00: forwarded_rs1 = rs1_data;
            2'b01: forwarded_rs1 = alu_result_mem;
            2'b10: forwarded_rs1 = wb_data;
            default: forwarded_rs1 = rs1_data;
        endcase
    end

    always_comb begin
        case (forward_b)
            2'b00: forwarded_rs2 = rs2_data;
            2'b01: forwarded_rs2 = alu_result_mem;
            2'b10: forwarded_rs2 = wb_data;
            default: forwarded_rs2 = rs2_data;
        endcase
    end

    assign rs2_data_forwarded = forwarded_rs2;

    // ALU operand selection
    wire [31:0] alu_operand_a = forwarded_rs1;
    wire [31:0] alu_operand_b = alu_src ? immediate : forwarded_rs2;

    //--------------------------------------------------------------------------
    // ALU Control Unit Instantiation
    //--------------------------------------------------------------------------
    alu_control_unit alu_ctrl_u (
        .alu_op     (alu_op),
        .funct3     (funct3),
        .funct7     (funct7),
        .alu_control(alu_control)
    );

    //--------------------------------------------------------------------------
    // ALU Instantiation (Uncomment when alu module available)
    //--------------------------------------------------------------------------
    /*
    alu alu_u (
        .operand_a    (alu_operand_a),
        .operand_b    (alu_operand_b),
        .alu_control  (alu_control),
        .alu_result   (alu_result),
        .zero_flag    (zero_flag),
        .negative_flag(negative_flag),
        .overflow_flag(overflow_flag),
        .carry_flag   (carry_flag)
    );
    */

    // For now, assign alu_result to zero to avoid uninitialized signal errors
    assign alu_result = 32'b0;
    assign zero_flag = (alu_result == 0);
    assign negative_flag = alu_result[31];

    //--------------------------------------------------------------------------
    // Branch and Jump Target Calculation
    //--------------------------------------------------------------------------
    assign branch_target = pc_in + immediate;
    assign jump_target = (funct3 == 3'b000) ? (pc_in + immediate) :    // JAL
                         (alu_result & 32'hFFFF_FFFE);                  // JALR (clear LSB)

    //--------------------------------------------------------------------------
    // Branch Taken Logic (clean combinational assignment)
    //--------------------------------------------------------------------------
    assign branch_taken = branch && (
        (funct3 == 3'b000 && zero_flag)   ||  // BEQ
        (funct3 == 3'b001 && !zero_flag)  ||  // BNE
        (funct3 == 3'b100 && negative_flag) ||  // BLT
        (funct3 == 3'b101 && !negative_flag) ||  // BGE
        (funct3 == 3'b110 && alu_result[0]) ||  // BLTU (unsigned)
        (funct3 == 3'b111 && !alu_result[0])    // BGEU (unsigned)
    );

    assign jump_taken = jump;

endmodule


//==============================================================================
// ALU Control Unit
//==============================================================================

module alu_control_unit (
    input  logic [2:0] alu_op,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    output logic [3:0] alu_control
);

    localparam ALU_ADD_OP    = 3'b000;
    localparam ALU_SUB_OP    = 3'b001;
    localparam ALU_AND_OP    = 3'b010;
    localparam ALU_OR_OP     = 3'b011;
    localparam ALU_XOR_OP    = 3'b100;
    localparam ALU_SHIFT_OP  = 3'b101;
    localparam ALU_COMP_OP   = 3'b110;
    localparam ALU_BRANCH_OP = 3'b111;

    always_comb begin
        case (alu_op)
            ALU_ADD_OP:    alu_control = 4'b0000; // ADD
            ALU_SUB_OP:    alu_control = 4'b0001; // SUB
            ALU_AND_OP:    alu_control = 4'b0010; // AND
            ALU_OR_OP:     alu_control = 4'b0011; // OR
            ALU_XOR_OP:    alu_control = 4'b0100; // XOR
            
            ALU_SHIFT_OP: begin
                case (funct3)
                    3'b001: alu_control = 4'b0101; // SLL
                    3'b101: alu_control = (funct7[5]) ? 4'b0111 : 4'b0110; // SRA : SRL
                    default: alu_control = 4'b0000;
                endcase
            end
            
            ALU_COMP_OP: begin
                case (funct3)
                    3'b010: alu_control = 4'b1000; // SLT
                    3'b011: alu_control = 4'b1001; // SLTU
                    default: alu_control = 4'b0000;
                endcase
            end
            
            ALU_BRANCH_OP: begin
                case (funct3)
                    3'b000: alu_control = 4'b1010; // BEQ
                    3'b001: alu_control = 4'b1011; // BNE
                    3'b100: alu_control = 4'b1100; // BLT
                    3'b101: alu_control = 4'b1101; // BGE
                    3'b110: alu_control = 4'b1110; // BLTU
                    3'b111: alu_control = 4'b1111; // BGEU
                    default: alu_control = 4'b0000;
                endcase
            end
            
            default: alu_control = 4'b0000; // Default ADD
        endcase
    end

endmodule
