//==============================================================================
// RISC-V Memory Access Stage
// Handles load/store operations with proper byte enable generation
//==============================================================================

module memory_stage (
    input  logic        clk,
    input  logic        rst_n,
    input  logic [31:0] alu_result,
    input  logic [31:0] rs2_data,
    input  logic        mem_read,
    input  logic        mem_write,
    input  logic [2:0]  funct3,
    
    // Data memory interface
    output logic [31:0] dmem_addr,
    output logic [31:0] dmem_wdata,
    input  logic [31:0] dmem_rdata,
    output logic        dmem_we,
    output logic [3:0]  dmem_be,
    output logic        dmem_req,
    input  logic        dmem_ready,
    
    // Output to writeback stage
    output logic [31:0] mem_data
);

    // Internal signals
    logic [31:0] load_data_raw;
    logic [31:0] store_data_aligned;
    logic [3:0]  byte_enable;
    logic [1:0]  byte_offset;
    
    // Address and byte offset calculation
    assign dmem_addr = {alu_result[31:2], 2'b00}; // Word-aligned address
    assign byte_offset = alu_result[1:0];
    
    // Memory request generation
    assign dmem_req = mem_read || mem_write;
    assign dmem_we = mem_write;
    
    //==========================================================================
    // Byte Enable Generation
    //==========================================================================
    
    always_comb begin
        byte_enable = 4'b0000; // default assignment
        case (funct3[1:0]) // Use lower 2 bits of funct3 for size
            2'b00: begin // Byte access (LB/SB)
                case (byte_offset)
                    2'b00: byte_enable = 4'b0001;
                    2'b01: byte_enable = 4'b0010;
                    2'b10: byte_enable = 4'b0100;
                    2'b11: byte_enable = 4'b1000;
                    default : byte_enable = 4'b0000;
                endcase
            end
            2'b01: begin // Halfword access (LH/SH)
                case (byte_offset[1])
                    1'b0: byte_enable = 4'b0011;
                    1'b1: byte_enable = 4'b1100;
                    default : byte_enable = 4'b0000;
                endcase
            end
            2'b10: begin // Word access (LW/SW)
                byte_enable = 4'b1111;
            end
            default: byte_enable = 4'b0000;
        endcase
    end
    
    assign dmem_be = byte_enable;
    
    //==========================================================================
    // Store Data Alignment
    //==========================================================================
    
    always_comb begin
        store_data_aligned = 32'b0; // default assignment
        case (funct3[1:0])
            2'b00: begin // Byte store
                case (byte_offset)
                    2'b00: store_data_aligned = {24'b0, rs2_data[7:0]};
                    2'b01: store_data_aligned = {16'b0, rs2_data[7:0], 8'b0};
                    2'b10: store_data_aligned = {8'b0, rs2_data[7:0], 16'b0};
                    2'b11: store_data_aligned = {rs2_data[7:0], 24'b0};
                    default: store_data_aligned = 32'b0;
                endcase
            end
            2'b01: begin // Halfword store
                case (byte_offset[1])
                    1'b0: store_data_aligned = {16'b0, rs2_data[15:0]};
                    1'b1: store_data_aligned = {rs2_data[15:0], 16'b0};
                    default: store_data_aligned = 32'b0;
                endcase
            end
            2'b10: begin // Word store
                store_data_aligned = rs2_data;
            end
            default: store_data_aligned = 32'b0;
        endcase
    end
    
    assign dmem_wdata = store_data_aligned;
    
    //==========================================================================
    // Load Data Processing
    //==========================================================================
    
    assign load_data_raw = dmem_rdata;
    
    always_comb begin
        if (mem_read) begin
            case (funct3)
                3'b000: begin // LB (Load Byte)
                    case (byte_offset)
                        2'b00: mem_data = {{24{load_data_raw[7]}}, load_data_raw[7:0]};
                        2'b01: mem_data = {{24{load_data_raw[15]}}, load_data_raw[15:8]};
                        2'b10: mem_data = {{24{load_data_raw[23]}}, load_data_raw[23:16]};
                        2'b11: mem_data = {{24{load_data_raw[31]}}, load_data_raw[31:24]};
                        default: mem_data = 32'b0;
                    endcase
                end
                3'b001: begin // LH (Load Halfword)
                    case (byte_offset[1])
                        1'b0: mem_data = {{16{load_data_raw[15]}}, load_data_raw[15:0]};
                        1'b1: mem_data = {{16{load_data_raw[31]}}, load_data_raw[31:16]};
                        default: mem_data = 32'b0;
                    endcase
                end
                3'b010: begin // LW (Load Word)
                    mem_data = load_data_raw;
                end
                3'b100: begin // LBU (Load Byte Unsigned)
                    case (byte_offset)
                        2'b00: mem_data = {24'b0, load_data_raw[7:0]};
                        2'b01: mem_data = {24'b0, load_data_raw[15:8]};
                        2'b10: mem_data = {24'b0, load_data_raw[23:16]};
                        2'b11: mem_data = {24'b0, load_data_raw[31:24]};
                        default: mem_data = 32'b0;
                    endcase
                end
                3'b101: begin // LHU (Load Halfword Unsigned)
                    case (byte_offset[1])
                        1'b0: mem_data = {16'b0, load_data_raw[15:0]};
                        1'b1: mem_data = {16'b0, load_data_raw[31:16]};
                        default: mem_data = 32'b0;
                    endcase
                end
                default: mem_data = load_data_raw;
            endcase
        end else begin
            mem_data = 32'b0;
        end
    end

endmodule
