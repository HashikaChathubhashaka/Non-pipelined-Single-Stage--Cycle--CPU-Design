module ALU(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [2:0] ALU_control,
    output logic zero_flag,
    output logic [31:0] ALU_result
);

    always_comb begin
        case (ALU_control)
            3'b000: ALU_result = a & b; // and
            3'b001: ALU_result = a | b; // or
            3'b010: ALU_result = a ^ b; // xor
            3'b011: ALU_result = a + b; // add
            3'b100: ALU_result = a - b; // sub
            3'b101: ALU_result = a << b; // sll (Shift Left Logical)
            3'b110: ALU_result = a >> b; // srl (Shift Right Logical)
            3'b111: ALU_result = a >>> b; // sra (Shift Right Arithmetic)
            
            default: ALU_result = 32'b0; // Default to 0 for undefined control values
        endcase
    end

    // Zero flag generation
    assign zero_flag = (ALU_result == 32'b0) ? 1'b1 : 1'b0;  //if result is 0, output of zero_flag is 1

endmodule

