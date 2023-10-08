module top_module (
    input rst,
    input clk,
    output [15:0] PC,
    output [31:0] Instruction
);

    wire [15:0] next_address;

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

endmodule
