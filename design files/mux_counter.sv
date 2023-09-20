
module mx_counter(
    input logic [31:0] adder,branch,
    input logic s,  //control  signal ( decider)
    output logic [31:0] c_inpt
);

    assign c_inpt = (~s) ? adder:branch;

endmodule


// s=0 --> next address
// s=1 --> branch instruction
