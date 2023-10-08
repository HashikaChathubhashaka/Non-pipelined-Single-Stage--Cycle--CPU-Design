
module top_module (
    input rst,
    input clk,
    output [15:0] PC
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

endmodule
