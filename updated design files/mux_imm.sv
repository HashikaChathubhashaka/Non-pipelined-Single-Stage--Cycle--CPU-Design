module mux_imm (
    input logic [6:0] a, // 7-bit input a
    input logic [4:0] b, // 5-bit input b
    input logic [11:0] c, // 12-bit input c
    input logic s, // Selector input
    output logic [11:0] d // 12-bit output
);

assign d = (s) ? {a, b} : c;

endmodule