//==============================================================================
// RISC-V Main Control Unit
// Generates control signals based on instruction opcode
//==============================================================================

module control_unit (
    input  logic [6:0] opcode,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    
    output logic       reg_write,
    output logic       mem_read,
    output logic       mem_write,
    output logic       alu_src,
    output logic [2:0] alu_op,
    output logic [1:0] wb_sel,
    output logic       branch,
    output logic       jump
);

    // RISC-V Opcodes (from specification research)
    localparam OP_IMM    = 7'b0010011; // I-type arithmetic
    localparam OP        = 7'b0110011; // R-type arithmetic  
    localparam LOAD      = 7'b0000011; // Load instructions
    localparam STORE     = 7'b0100011; // Store instructions
    localparam BRANCH    = 7'b1100011; // Branch instructions
    localparam JAL       = 7'b1101111; // Jump and link
    localparam JALR      = 7'b1100111; // Jump and link register
    localparam LUI       = 7'b0110111; // Load upper immediate
    localparam AUIPC     = 7'b0010111; // Add upper immediate to PC
    
    // ALU Operation encoding
    localparam ALU_ADD   = 3'b000;
    localparam ALU_SUB   = 3'b001;
    localparam ALU_AND   = 3'b010;
    localparam ALU_OR    = 3'b011;
    localparam ALU_XOR   = 3'b100;
    localparam ALU_SHIFT = 3'b101;
    localparam ALU_COMP  = 3'b110;
    localparam ALU_BRANCH= 3'b111;
    
    // Writeback source selection
    localparam WB_ALU    = 2'b00;
    localparam WB_MEM    = 2'b01;
    localparam WB_PC4    = 2'b10;
    localparam WB_IMM    = 2'b11;
    
    // Main control logic
    always_comb begin
        // Default values
        reg_write = 1'b0;
        mem_read  = 1'b0;
        mem_write = 1'b0;
        alu_src   = 1'b0;
        alu_op    = ALU_ADD;
        wb_sel    = WB_ALU;
        branch    = 1'b0;
        jump      = 1'b0;
        
        case (opcode)
            OP_IMM: begin // I-type arithmetic
                reg_write = 1'b1;
                alu_src   = 1'b1; // Use immediate
                wb_sel    = WB_ALU;
                case (funct3)
                    3'b000: alu_op = ALU_ADD;    // ADDI
                    3'b111: alu_op = ALU_AND;    // ANDI
                    3'b110: alu_op = ALU_OR;     // ORI
                    3'b100: alu_op = ALU_XOR;    // XORI
                    3'b010: alu_op = ALU_COMP;   // SLTI
                    3'b011: alu_op = ALU_COMP;   // SLTIU
                    3'b001: alu_op = ALU_SHIFT;  // SLLI
                    3'b101: alu_op = ALU_SHIFT;  // SRLI/SRAI
                endcase
            end
            
            OP: begin // R-type arithmetic
                reg_write = 1'b1;
                alu_src   = 1'b0; // Use register
                wb_sel    = WB_ALU;
                case (funct3)
                    3'b000: alu_op = (funct7[5]) ? ALU_SUB : ALU_ADD; // ADD/SUB
                    3'b111: alu_op = ALU_AND;    // AND
                    3'b110: alu_op = ALU_OR;     // OR  
                    3'b100: alu_op = ALU_XOR;    // XOR
                    3'b010: alu_op = ALU_COMP;   // SLT
                    3'b011: alu_op = ALU_COMP;   // SLTU
                    3'b001: alu_op = ALU_SHIFT;  // SLL
                    3'b101: alu_op = ALU_SHIFT;  // SRL/SRA
                endcase
            end
            
            LOAD: begin // Load instructions
                reg_write = 1'b1;
                mem_read  = 1'b1;
                alu_src   = 1'b1; // Use immediate for address calculation
                alu_op    = ALU_ADD;
                wb_sel    = WB_MEM;
            end
            
            STORE: begin // Store instructions
                mem_write = 1'b1;
                alu_src   = 1'b1; // Use immediate for address calculation
                alu_op    = ALU_ADD;
            end
            
            BRANCH: begin // Branch instructions
                branch    = 1'b1;
                alu_src   = 1'b0; // Compare registers
                alu_op    = ALU_BRANCH;
            end
            
            JAL: begin // Jump and link
                reg_write = 1'b1;
                jump      = 1'b1;
                wb_sel    = WB_PC4;
            end
            
            JALR: begin // Jump and link register
                reg_write = 1'b1;
                jump      = 1'b1;
                alu_src   = 1'b1; // Use immediate for target calculation
                alu_op    = ALU_ADD;
                wb_sel    = WB_PC4;
            end
            
            LUI: begin // Load upper immediate
                reg_write = 1'b1;
                wb_sel    = WB_IMM;
            end
            
            AUIPC: begin // Add upper immediate to PC
                reg_write = 1'b1;
                alu_src   = 1'b1; // Use immediate
                alu_op    = ALU_ADD;
                wb_sel    = WB_ALU;
            end
            
            default: begin
                // NOP - all control signals remain at default values
            end
        endcase
    end

endmodule
