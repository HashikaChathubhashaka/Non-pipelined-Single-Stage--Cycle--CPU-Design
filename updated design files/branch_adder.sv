module branch_adder (
    input logic [31:0] a, // 32-bit input A // comming from sign extend
    input logic [15:0] b, // 16-bit input B // from 1st program counter
    output logic [15:0] sum // 16-bit sum output 
);

assign sum = (a[15:0] << 2) + b; // shift the a , then adding the previous adder value.

endmodule