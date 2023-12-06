module mux_aluordata (
    input logic [31:0] a, // Input from ALU (ALU_result)
    input logic [31:0] b, // Input from data memory (DataMemOut)
    input logic MemtoReg, // Control signal to select between a and b
    output logic [31:0] c // Output to register file (WD3)
);

    assign c = (MemtoReg) ? b : a;

endmodule

