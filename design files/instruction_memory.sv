module instruction_memory(
    input logic  [15:0] A; //address -> 32 bits   --> so there can be 2^32 differnt adresses
    output logic [31:0] RD; 
);

    //making the instruction memory
    reg [7:0] mem [1023:0]; // making array of 1024 , which each element has byte value.
    assign RD = mem[A] + mem[A+1] + mem[A+2] + mem[A+3] ;

//instruction memory, bytable.


    initial begin
    mem[0] = 32'h00000020;
    mem[1] = 32'h00000021;
    mem[2] = 32'h00000031;
    mem[3] = 32'h00000005;


    end


endmodule

