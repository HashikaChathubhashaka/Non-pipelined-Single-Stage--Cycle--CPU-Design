module data_memory(
    input logic clk,
    input logic WE, //write enable        
    
    input [31:0] WD, //write data
    input [31:0] A, // from arithmatic and logic unit
    output [31:0] RD, // read data


    // A -> wanted memory address

);
    reg[31:0] mem [1023:0];  //making the memory register(memory storage)
    //memory has 1024 locations.

    always_ff @(posedge clk)
    begin
        if (WE)
        mem[A] <= WD; 
    end

    assign RD= mem[A];

    initial begin
        //intializing wanted data
        mem[30] = 32'h00000020;
    end
