module data_memory(
    input logic clk,
    input logic WE, // Write enable   
    input [2:0] load_type, // 3-bit input to specify the load type	 
    input [31:0] WD, // Write data
    input [31:0] A, // Memory address
    output [31:0] RDm // Read data
);

    reg [31:0] mem [1023:0]; // Memory storage with 1024 locations

	 

	 
    always @(posedge clk) begin
       if (WE) begin
            case (load_type)
                2'b000: mem[A][7:0] <= WD[7:0]; // Store a byte 
                2'b001: mem[A][15:0] <= WD[15:0]; // Store a half
                default: mem[A] <= WD; // Store the full word
            endcase
        end
	end

	assign RDm = (load_type == 3'b000) ? {{24{mem[A][7]}}, mem[A][7:0]} :
					(load_type ==  3'b001) ? {{16{mem[A][15]}}, mem[A][15:0]}:
					(load_type ==  3'b100) ?  {24'b0, mem[A][7:0]}:
					 (load_type == 3'b010) ?  mem[A]:
													  mem[A];
												 
	 

    initial begin
        mem[2] = 32'h00000006; //
        mem[4] = 32'h00000001; // 
        mem[10] = 32'h00000015; // want to store 15 
        mem[11] = 32'h00000006; //		 
		  
    end	 
	 
	 

endmodule
