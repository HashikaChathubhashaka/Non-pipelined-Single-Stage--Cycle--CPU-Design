module ALU_decoder(
    input logic [1:0] ALUOp, // from main_decoder
    input logic [2:0] funct3, // instruction
    input logic [6:0] funct7, // instruction
    input logic [6:0] op,  // opcode

    output [3:0] ALU_control //output to ALU
);

    assign ALU_control = (ALUOp == 2'b01) ?   4'b0011: // for I and S  // in ALU go for add
								(ALUOp == 2'b11) ?   4'b0100: // For Branch // go for Sub
	 
								((ALUOp == 2'b10) && (funct3 == 3'b111) && ({op[5], funct7[5]} == 2'b11))  ? 4'b1110: //MUL (only for register)
                        ((ALUOp == 2'b10) && (funct3 == 3'b111) && ({op[5], funct7[5]} != 2'b11))  ? 4'b0000:  // and 
                        ((ALUOp == 2'b10) && (funct3 == 3'b110)) ? 4'b0001:  // or 
                        ((ALUOp == 2'b10) && (funct3 == 3'b100)) ? 4'b0010:  // xor 
                        ((ALUOp == 2'b10) && (funct3 == 3'b000) && ({op[5], funct7[5]} != 2'b11)) ? 4'b0011 : //add                         
                        ((ALUOp == 2'b10) && (funct3 == 3'b000) && ({op[5], funct7[5]} == 2'b11)) ? 4'b0100 :  //sub (only for register)
                        ((ALUOp == 2'b10) && (funct3 == 3'b001)) ? 4'b0101:  // sll 
                        ((ALUOp == 2'b10) && (funct3 == 3'b101) && ({funct7[5]} == 1'b0)) ? 4'b0110 : //srl                       
                        ((ALUOp == 2'b10) && (funct3 == 3'b101) && ({funct7[5]} == 1'b1)) ? 4'b0111 :  //sra
                        ((ALUOp == 2'b10) && (funct3 == 3'b010)) ? 4'b1001:  // slt
                        ((ALUOp == 2'b10) && (funct3 == 3'b011)) ? 4'b1000:  // sltu
							
																					  
                                                                4'b1111;  // in ALU go for defult
endmodule



// mul 

// 0100000 rs2 rs1 111 rd 0110011