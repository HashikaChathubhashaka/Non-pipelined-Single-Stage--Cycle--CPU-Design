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
	 
	 mem[0]  = 32'h00000020; // Instruction 0
    mem[1]  = 32'h00000021; // Instruction 1
    mem[2]  = 32'h00000031; // Instruction 2
    mem[3]  = 32'h00000005; // Instruction 3
    mem[4]  = 32'h00000100; // Instruction 4
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


