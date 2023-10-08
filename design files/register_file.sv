
module register_file(
    input wire clk, 
    input wire WE3, // o or 1 -> write enable

    input logic [4:0] A1, A2, A3,  //5 bits values come from the instruction memory , addresses of memor locations
	 //A3 -> data writing address

    input logic [31:0] WD3, // write data
    output logic [31:0] RD1, RD2 
);

    reg [31:0] Register [31:0]; //making size of 32 array , maximum size for 5 bit address

	reg register [31:0];


    always @(posedge clk) begin
        if (WE3)
            Register[A3] <= WD3;
    end

    assign RD1 = Register[A1];
    assign RD2 = Register[A2];

    initial begin // register memory data

		Register[0] = 32'h00000000;
		Register[1] = 32'h00000001;
		Register[2] = 32'h00000002;
		Register[3] = 32'h00000003;
		Register[4] = 32'h00000004;
		Register[5] = 32'h00000005;
		Register[6] = 32'h00000006;
		Register[7] = 32'h00000007;
		Register[8] = 32'h00000008;
		Register[9] = 32'h00000009;
    end

endmodule
