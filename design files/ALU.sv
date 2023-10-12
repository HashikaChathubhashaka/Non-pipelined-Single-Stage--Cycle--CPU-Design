module ALU(
    input logic [31:0] a, // mem register
    input logic [31:0] b, // mem register
    input logic [3:0] ALU_control, // ALU_decoder

    output logic zero_flag,
    output logic [31:0] ALU_result
);

    always_comb begin
        case (ALU_control)
            4'b0000: ALU_result = a & b; // and
            4'b0001: ALU_result = a | b; // or
            4'b0010: ALU_result = a ^ b; // xor
            4'b0011: ALU_result = a + b; // add
            4'b0100: ALU_result = a - b; // sub
            4'b0101: ALU_result = a << b; // sll (Shift Left Logical)
            4'b0110: ALU_result = a >> b; // srl (Shift Right Logical)
            4'b0111: ALU_result = a >>> b; // sra (Shift Right Arithmetic)
            
            default: ALU_result = 32'b0; // Default to 0 for undefined control values
        endcase
    end

    // Zero flag generation
    assign zero_flag = (ALU_result == 32'b0) ? 1'b1 : 1'b0;  //if result is 0, output of zero_flag is 1

endmodule

