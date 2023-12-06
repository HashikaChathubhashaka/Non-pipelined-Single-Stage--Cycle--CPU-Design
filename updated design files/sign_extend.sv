module sign_extend (
    input logic [11:0] imm_in, // Original 12-bit immediate
	 input logic [4:0] imm_in2,
	 input logic [1:0] selection,
    output logic [31:0] imm_out // Sign-extended 32-bit immediate
);

		assign imm_out = (selection ==  2'b00) ? {{20{imm_in[11]}}, imm_in}: // Sign extension for normal I type and Load types
							  (selection ==  2'b10) ? {{26{imm_in[5]}}, imm_in[5:0]}: // for SLLI, SRLI, and SRAI
							  (selection ==  2'b01) ? {{20{imm_in[11]}}, imm_in[11:5] , imm_in2[4:0] }: // for S (store)
							  (selection ==  2'b11) ? {{20{imm_in[11]}},imm_in2[0] , imm_in[10:5] , imm_in2[4:1] }: // for branch (offset)
							  {{20{imm_in[11]}}, imm_in}; // for default 
endmodule
