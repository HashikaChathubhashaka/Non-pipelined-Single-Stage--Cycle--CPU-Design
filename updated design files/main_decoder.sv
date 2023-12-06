module main_decoder(
    input logic [6:0] Op, //op code
    input logic [2:0] funct3, // instruction
    output logic RegWrite, // registor wtire enable or not
	 output logic ALUSrc, // for ALU mux
	 
	 output logic [1:0] signexselec, // for sign extend selection
	 output logic branch, // for branching instruction

    output logic [1:0] ALUOp, // output for ALU decoder
	 output logic MemWrite, // Memory write enable for I-type (store) instructions
	 output logic MemtoReg // Memory to register data path control signal(for mux)
);

									//I type(r)				//R type					//I type(load)
    assign RegWrite = (Op == 7'b0010011 || Op == 7'b0110011 || Op == 7'b0000011) ? 1'b1 : 1'b0;  
    // !Regwrite need in R type 

									//I type(r) 		 //R type
    assign ALUOp = (Op == 7'b0010011 || Op == 7'b0110011 ) ? 2'b10 : // R tpye or I(r) type
                    (Op == 7'b0100011 || Op == 7'b0000011) ? 2'b01 :  // I type and S type , go for sum
						  (Op == 7'b1100011) ? 2'b11 : // for branch type , go for sub
                                        2'b00;
	
										//I type(r)         //S type        //I type
    assign ALUSrc = (Op == 7'b0010011 || Op == 7'b0100011 || Op == 7'b0000011) ? 1'b1 : // for immediate mux selection.
                                         1'b0 ; // select from register (R type - rd2)
   
									//I type
	 assign MemtoReg = (Op == 7'b0000011) ? 1'b1 : 1'b0; // for selecting from register or alu output(mux)

    // enable MemWrite for S-type instructions
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 : 1'b0;	 
	 
	 
	 assign branch = (Op == 7'b1100011) ? 1'b1 : 1'b0;	// for B type instruction

											//I type 
    assign signexselec = (Op == 7'b0010011 & ( funct3== 7'b001 || funct3== 7'b101 )) ? 2'b10 : // SLLI,SRLI,SRAI
                    (Op == 7'b0100011) ? 2'b01:  //S type  
						  
						  (Op == 7'b1100011) ? 2'b11:  //Branch type
                                         2'b00; // default - normal I types and Load types
													  
endmodule


/* 

!opcodes definitions

*  0110011 - R type instruction
*  0010011 - I type instruction
*  0000011 - I type(load)
*  0100011 - S type
*  1100011 - B type

   */


/* 

! ALUOp

*  10 - R type instruction

   */