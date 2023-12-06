module mux_alu (
    input logic [31:0] a, b,
    input logic s,
    output logic [31:0] c
);

     assign c = (s) ? a : b ;

endmodule
