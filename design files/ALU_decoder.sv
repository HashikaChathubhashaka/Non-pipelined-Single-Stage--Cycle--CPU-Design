module ALU_decoder(
    input [1:0] ALUOp, // from main_decoder
    input [2:0] funct3, // instruction
    input [6:0] funct7, // instruction
    input [6:0] op,  // opcode

    output [3:0] ALU_control //output to ALU
);

    assign ALU_control = (ALUOp == 2'b00) ?  : 4'b1000; // not for R type
                        ((ALUOp == 2'b10) && (funct3 == 3'b111)) ? 4'b0000 :  // and 
                        ((ALUOp == 2'b10) && (funct3 == 3'b110)) ? 4'b0001:  // or 
                        ((ALUOp == 2'b10) && (funct3 == 3'b100)) ? 4'b0010:  // xor 
                        ((ALUOp == 2'b10) && (funct3 == 3'b000) && ({op[5], funct7[5]} == 2'b10)) ? 4'b0011 : //add                        
                        ((ALUOp == 2'b10) && (funct3 == 3'b000) && ({op[5], funct7[5]} == 2'b11)) ? 4'b0100 :  //sub
                        ((ALUOp == 2'b10) && (funct3 == 3'b001)) ? 4'b0101:  // sll 
                        ((ALUOp == 2'b10) && (funct3 == 3'b101) && ({op[5], funct7[5]} == 2'b10)) ? 4'b0110 : //srl                       
                        ((ALUOp == 2'b10) && (funct3 == 3'b101) && ({op[5], funct7[5]} == 2'b11)) ? 4'b0111 :  //sra
                                                                4'b1111;
endmodule
