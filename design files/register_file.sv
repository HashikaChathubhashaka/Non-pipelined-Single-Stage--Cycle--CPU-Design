module register_fle(
    input wire clk,

    input logic A1[4:0],
    input logic A2[4:0], // represent every number in 32 array  -> 5 bit enough
    input logic WD3[31:0],

    output logic RD1[31:0],
    output logic RD2[31:0]
);

    reg[31:0] Register [31:0];
    // size 32 array , each array value has 32 bit number assign

    always_ff(posedge clk)
    begin
        if(WD3) begin
            Register[A3] <= WD3;
        end

    //geting values in register
    assign RD1 = Register[A1];
    assign RD2 = Register[A2];

    end

    intial begin   
        Register[5] = 32'h00000005;

    end


endmodule