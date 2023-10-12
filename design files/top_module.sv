module top_module (
    input rst,
    input clk,
    output [15:0] PC,
    output [31:0] Instruction,
    output [31:0] RD1, // For A1
    output [31:0] RD2, // For A2
    output [3:0] ALU_control, // Output to control ALU operation
    output zero_flag, // Output zero flag
    output [31:0] ALU_result, // Output of the ALU
    output RegWrite // Register write enable or not (output to top_decoder_module)
);

    wire [15:0] next_address;
    wire [3:0] main_ALU_control; // Intermediate signal to connect top_decoder_module and ALU

    p_counter counter_inst (
        .rst(rst),
        .clk(clk),
        .PC_Next(next_address),
        .PC(PC)
    );

    pc_adder adder_inst (
        .current_address(PC),
        .next_address(next_address)
    );

    instruction_memory instr_mem (
        .A(PC), // Connect PC directly as the address
        .RD(Instruction)
    );

    register_file reg_file (
        .clk(clk),
        .WE3(RegWrite), // Disable writes for now
        .A1(Instruction[19:15]), // Use A1 as the address for RD1
        .A2(Instruction[24:20]), // Use A2 as the address for RD2
        .A3(Instruction[11:7]),  // Extract A3 address bits from the instruction
        .WD3(ALU_result), // from ALU
        .RD1(RD1),
        .RD2(RD2)
    );

    top_decoder_module td (
        .Op(Instruction[6:0]), // Connect the opcode from the instruction
        .funct3(Instruction[14:12]), // Connect funct3 from the instruction
        .funct7(Instruction[31:25]), // Connect funct7 from the instruction
        .RegWrite(RegWrite), // Connect RegWrite
        .ALU_control(main_ALU_control) // Connect main_ALU_control
    );

    ALU alu_inst (
        .a(RD1),
        .b(RD2),
        .ALU_control(main_ALU_control), // Connect main_ALU_control
        .zero_flag(zero_flag),
        .ALU_result(ALU_result)
    );

endmodule
