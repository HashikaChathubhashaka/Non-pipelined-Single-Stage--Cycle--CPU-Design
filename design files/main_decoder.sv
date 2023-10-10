module Main_Decoder(
    input [6:0] Op, //op code
    output RegWrite, // registor wtire enable or not

    output [1:0] ALUOp // output for ALU decoder
);

    assign RegWrite = (Op == 7'b0000011 || Op == 7'b0110011) ? 1'b1 : 1'b0;  
    // !Regwrite need in R type 


    assign ALUOp = (Op == 7'b0110011) ? 2'b10 : // R tpye
                    (Op == 7'b1100011) ? 2'b01 :
                                        2'b00;

endmodule


/* 

!opcodes definitions

*  0110011 - R type instruction
*  0010011 - I type instruction

   */


/* 

! ALUOp

*  10 - R type instruction

   */