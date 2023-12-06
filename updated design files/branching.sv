module branching(
	input zero, // from ALU
	input sign,  //from ALU
	input unsign, //from ALU
	
	input branch, //from Control unit
	input [2:0] funct3, // from instruction
	output PCSrc  // to mux
	);
	
   assign PCSrc = (branch==1'b1 && funct3 == 3'b000 && zero==1'b1) ?    1'b1: // branch if equal
	
						(branch==1'b1 && funct3 == 3'b001 && zero==1'b0) ?    1'b1:  // branch if not equal
						
						(branch==1'b1 && funct3 == 3'b100 && sign==1'b0) ?    1'b1:   //branch less than (sign)
						(branch==1'b1 && funct3 == 3'b110 && unsign==1'b0) ?  1'b1:  //branch less than(unsign)
						(branch==1'b1 && funct3 == 3'b101 && sign==1'b1) ?    1'b1: 	  //branch grater than(sign)
						(branch==1'b1 && funct3 == 3'b111 && sign==1'b1) ?    1'b1:    // branch grater than (unsign)
                                                                        1'b0;  // dont branch
																					 

endmodule 