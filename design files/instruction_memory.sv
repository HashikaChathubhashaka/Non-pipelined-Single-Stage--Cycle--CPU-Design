module instruction_memory(
    input logic  [31:0] A; //address -> 32 bits   --> so there can be 2^32 differnt adresses
    output logic [31:0] RD; 
);

    //making the instruction memory
    reg [31:0] mem [1023:0]; // making array of 1024 , which each element has 32 bits value.
    


    assign RD = mem[A[31:2]];


    
    initial begin
    mem[1] = 32'h00B62423;
    mem[0] = 32'h0062E233;
    //mem[0] = 32'hFFC4A303;
    //mem[1] = 32'h00832383;
    // mem[0] = 32'h0064A423;

    // mem[1] = 32'h00B62423;

    end


endmodule