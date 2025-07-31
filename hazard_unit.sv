//==============================================================================
// RISC-V Hazard Detection and Forwarding Unit
// Handles data hazards, control hazards, and pipeline control
//==============================================================================

module hazard_unit (
    input  logic        clk,
    input  logic        rst_n,
    
    // Instruction decode stage inputs
    input  logic [4:0]  rs1_addr_id,
    input  logic [4:0]  rs2_addr_id,
    
    // Pipeline stage register addresses
    input  logic [4:0]  rd_addr_ex,
    input  logic [4:0]  rd_addr_mem,
    input  logic [4:0]  rd_addr_wb,
    
    // Pipeline stage control signals
    input  logic        reg_write_ex,
    input  logic        reg_write_mem,
    input  logic        reg_write_wb,
    input  logic        mem_read_ex,
    
    // Branch/Jump control
    input  logic        branch_taken,
    input  logic        jump_taken,
    
    // Hazard control outputs
    output logic        stall,
    output logic        flush,
    output logic [1:0]  forward_a,
    output logic [1:0]  forward_b,
    
    // Pipeline register enables
    output logic        if_id_enable,
    output logic        id_ex_enable,
    output logic        ex_mem_enable,
    output logic        mem_wb_enable
);

    // Forwarding control encoding
    localparam FORWARD_NONE = 2'b00;
    localparam FORWARD_MEM  = 2'b01;
    localparam FORWARD_WB   = 2'b10;
    
    logic data_hazard_stall;
    logic control_hazard_flush;
    
    //==========================================================================
    // Data Forwarding Logic
    //==========================================================================
    
    // Forward A (RS1) logic
    always_comb begin
        if (reg_write_mem && (rd_addr_mem != 5'b0) && (rd_addr_mem == rs1_addr_id)) begin
            forward_a = FORWARD_MEM;
        end else if (reg_write_wb && (rd_addr_wb != 5'b0) && (rd_addr_wb == rs1_addr_id) &&
                    !(reg_write_mem && (rd_addr_mem != 5'b0) && (rd_addr_mem == rs1_addr_id))) begin
            forward_a = FORWARD_WB;
        end else begin
            forward_a = FORWARD_NONE;
        end
    end
    
    // Forward B (RS2) logic  
    always_comb begin
        if (reg_write_mem && (rd_addr_mem != 5'b0) && (rd_addr_mem == rs2_addr_id)) begin
            forward_b = FORWARD_MEM;
        end else if (reg_write_wb && (rd_addr_wb != 5'b0) && (rd_addr_wb == rs2_addr_id) &&
                    !(reg_write_mem && (rd_addr_mem != 5'b0) && (rd_addr_mem == rs2_addr_id))) begin
            forward_b = FORWARD_WB;
        end else begin
            forward_b = FORWARD_NONE;
        end
    end
    
    //==========================================================================
    // Load-Use Hazard Detection
    //==========================================================================
    
    always_comb begin
        data_hazard_stall = 1'b0;
        
        // Load-use hazard: Load in EX stage, dependent instruction in ID stage
        if (mem_read_ex && 
            ((rd_addr_ex == rs1_addr_id) || (rd_addr_ex == rs2_addr_id)) &&
            (rd_addr_ex != 5'b0)) begin
            data_hazard_stall = 1'b1;
        end
    end
    
    //==========================================================================
    // Control Hazard Detection  
    //==========================================================================
    
    always_comb begin
        control_hazard_flush = branch_taken || jump_taken;
    end
    
    //==========================================================================
    // Pipeline Control
    //==========================================================================
    
    assign stall = data_hazard_stall;
    assign flush = control_hazard_flush;
    
    // Pipeline register enables
    assign if_id_enable   = !stall;
    assign id_ex_enable   = !stall;
    assign ex_mem_enable  = 1'b1;
    assign mem_wb_enable  = 1'b1;

endmodule
