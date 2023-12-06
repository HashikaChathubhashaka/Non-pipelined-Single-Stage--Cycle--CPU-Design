module mux_pc (
    input logic [15:0] a, b,
    input logic s,
    output logic [15:0] c
);

    assign c = (s) ? a : b;

endmodule