module p_counter (rst, clk,PC_Next,PC);
    input rst, clk;
    input [15:0] PC_Next;
    output reg [15:0] PC;
    

    always_ff @(posedge clk or posedge rst) 
        if (rst) PC <= 32'h0;
        else    PC = PC_Next;

endmodule

