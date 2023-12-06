module instruction_memory(
    input logic  [15:0] A, //address -> 16 bits   --> so there can be 2^16 differnt adresses
    output logic [31:0] RD // 32 bit processor mean in one instructor there are 32 bits
);

    //making the instruction memory
    reg [31:0] mem [1023:0]; // making array of 1024 
    assign RD = mem[A[15:2]]  ; //since we adding 4 to program counter , remove the last two bits

//instruction memory, bytable.


    initial begin

    //instruction set
	 
      mem[0] = 32'b0000000_00100_00010_000_00000_0110011; // R-type Instruction 0 (add)     reg[1]+reg[2] -> reg[0] //video 1
		mem[1] = 32'b0000000_00100_00011_000_00000_0110011; // R-type Instruction 0 (add)     reg[1]+reg[2] -> reg[0]
		//mem[2] = 32'b0000000_00100_00111_000_00000_0110011; // R-type Instruction 0 (add)     reg[1]+reg[2] -> reg[0]
	  mem[2] = 32'b000000001010_01111_111_00000_0010011; // ANDI
	
		mem[3] = 32'b0000000_00011_00001_001_10010_1100011; // branch (if not equal) (offset 9) start from 11 
//		
//		
//		
//      mem[2] = 32'b0000000_00000_00100_111_00000_0110011; // R-type Instruction 1 (and)     reg[3]&reg[4] -> reg[0]
// 
//      mem[3] = 32'b0000000_00111_01000_000_00000_0110011; // R-type Instruction 3 (add)     reg[7]+reg[8] -> reg[0]
      mem[4] = 32'b0000000_01001_01010_000_00000_0110011; // R-type Instruction 4 (add)     reg[9]+reg[10]-> reg[0]
//      mem[4] = 32'b0000000_01001_01010_000_00000_0110011; // R-type Instruction 4 (add)     reg[9]+reg[10]-> reg[0]
//      mem[4] = 32'b0000000_00010_00110_001_00000_0110011; // R-type Instruction 4 (sll)     6 << 2 = > 32'h00000018  (32'h00000006 << 2 )
//		
//				
//				// I-Type Instructions (Numbered 5 to 10)
		mem[5] = 32'b00000000111_00010_000_00000_0010011;    // ADDI
		mem[6] = 32'b0000000_00010_00011_001_00000_0010011;  // SLTI
		mem[7] = 32'b0000000_00100_00101_010_00000_0010011;  // SLTIU
		mem[8] = 32'b0000000_00110_00111_100_00000_0010011;  // XORI
		mem[9] = 32'b00000000100_01001_110_00000_0010011;   // ORI
		mem[10] = 32'b000000001010_01011_111_00000_0010011; // ANDI
//	
//		
//		
		mem[11] = 32'b00000000010_00001_010_00011_0000011; // LW   -> data memory address[ R[1]+2(offset) ] - > register [3] 
//		
		mem[12] = 32'b0000000_00001_00010_000_00000_0110011; // R-type Instruction 0 (add)     reg[1]+reg[2] -> reg[0]
		mem[13] = 32'b0000000_00001_00011_000_00000_0110011; // R-type Instruction 0 (add)     reg[1]+reg[3] -> reg[0]   , use for checking the LW .
		mem[14] = 32'b000000001010_01011_111_00000_0010011; // ANDI
//		
		mem[15] = 32'b0000100_00010_01000_001_00010_0010011; // SLLI  (done) ( 8 is shift by 2 ) (output =32)  
//
    	mem[16] = 32'b0100000_00101_00010_111_00010_0110011;  //mul (r type)// video
//		
		mem[17] = 32'b0000000_10100_01001_001_00001_0100011; // store [register file[20]= 15] -->  in data memory [9+1 = 10] save 		
		
// 1 to 16		
		
		
//    mem[5]  = 32'h00000200; // Instruction 5
//    mem[6]  = 32'h00000300; // Instruction 6
//    mem[7]  = 32'h00000400; // Instruction 7
//    mem[8]  = 32'h00000500; // Instruction 8
//    mem[9]  = 32'h00000600; // Instruction 9
//    mem[10] = 32'h00000700; // Instruction 10
//    mem[11] = 32'h00000800; // Instruction 11
//    mem[12] = 32'h00000900; // Instruction 12
//    mem[13] = 32'h00000A00; // Instruction 13
//    mem[14] = 32'h00000B00; // Instruction 14
//    mem[15] = 32'h00000C00; // Instruction 15



    end


endmodule


// mul 

// 0100000 rs2 rs1 111 rd 0110011

//rs1 =a 
//rs2 =b

/* 

!opcodes definitions

*  0110011 - R type instruction

*  0010011 - I type instruction

*  1100011 - branch

   */

/*
? R type 

* add - 0000000   000
* sub - 0100000   000
* sll - 0000000   001
* slt - 0000000   010
* sltu- 0000000   011
* xor - 0000000   100
* srl - 0000000   101
* sra - 0100000   101
* or  - 0000000   110
* and - 0000000   111


*/
