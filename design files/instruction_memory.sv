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

      mem[0] = 32'b0000000_00001_00010_000_00000_0110011; // R-type Instruction 0 (add)
      mem[1] = 32'b0000000_00011_00100_000_00000_0110011; // R-type Instruction 1 (add)
      mem[2] = 32'b0000000_00101_00110_000_00000_0110011; // R-type Instruction 2 (add)
      mem[3] = 32'b0000000_00111_01000_000_00000_0110011; // R-type Instruction 3 (add)
      mem[4] = 32'b0000000_01001_01010_000_00000_0110011; // R-type Instruction 4 (add)

    mem[5]  = 32'h00000200; // Instruction 5
    mem[6]  = 32'h00000300; // Instruction 6
    mem[7]  = 32'h00000400; // Instruction 7
    mem[8]  = 32'h00000500; // Instruction 8
    mem[9]  = 32'h00000600; // Instruction 9
    mem[10] = 32'h00000700; // Instruction 10
    mem[11] = 32'h00000800; // Instruction 11
    mem[12] = 32'h00000900; // Instruction 12
    mem[13] = 32'h00000A00; // Instruction 13
    mem[14] = 32'h00000B00; // Instruction 14
    mem[15] = 32'h00000C00; // Instruction 15

    end


endmodule


/* 

!opcodes definitions

*  0110011 - R type instruction

*  0010011 - I type instruction

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