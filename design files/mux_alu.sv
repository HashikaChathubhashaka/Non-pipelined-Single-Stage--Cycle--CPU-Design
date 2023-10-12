
module mx_alu(
    input logic [31:0] read_data2,im,
    input logic ALUSrc,  //control  signal ( decider)
    output logic [31:0] alu_in
);

    assign alu_in = (ALUSrc) ? im:read_data2;

endmodule



// ALUSrc true - >  im
// ALUSrc false -> from register