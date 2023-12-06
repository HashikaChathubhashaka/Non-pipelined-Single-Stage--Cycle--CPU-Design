module top_module (
    input  rst,
    input  clk,
    output [15:0] PC,
    output [31:0] Instruction,
    output [31:0] RD1, // For A1
    output [31:0] RD2, // For A2
    output [3:0] ALU_control, // Output to control ALU operation
    output zero_flag, // Output zero flag
    output [31:0] ALU_result, // Output of the ALU
	 output [31:0] mux_out_alu,
	 output [31:0] DataMemOut,
	 output [31:0] mux_out2,	 
	 output MemtoReg,
	 output branch,
	 output PCSrc,
	 output logic [16:0] leds,
	 output logic x,
	 
	 //input z,
	 
    output RegWrite // Register write enable or not (output to top_decoder_module)
);

    wire [15:0] next_address;
    wire [3:0] main_ALU_control; // Intermediate signal to connect top_decoder_module and ALU
	 
	 logic [31:0] imm_out;
    logic [31:0] ALUSrc;
	 logic MemWrite;
	 
	 
	 logic sign_condition; //for branching 
	 logic unsign_condition; //for branching
	 
	 logic [1:0] signexselec; // selection for immediate 
	 logic  [15:0] pc_mux;
	 logic  [15:0] pc_mux_out;
	 
	 
	 logic [16:0] temp_leds;
	 
	 assign temp_leds = ALU_result[16:0];
	 assign leds = temp_leds;
	 
	 assign x = RegWrite;

	 
	 

	 
    p_counter counter_inst (
        .rst(rst),
        .clk(clk),
        .PC_Next(pc_mux_out), // next_address - to connect normal adder
        .PC(PC)
    );
	 

    pc_adder adder_inst (
        .current_address(PC),
        .next_address(next_address)
    );

    instruction_memory instr_mem (
        .A(PC), // Connect PC directly as the address
        .RD(Instruction)
    );

    register_file reg_file (
        .clk(clk),
        .WE3(RegWrite), // Disable writes for now
        .A1(Instruction[19:15]), // Use A1 as the address for RD1
        .A2(Instruction[24:20]), // Use A2 as the address for RD2
        .A3(Instruction[11:7]),  // Extract A3 address bits from the instruction
        .WD3(mux_out2), // from ALU
        .RD1(RD1),
        .RD2(RD2)
    );
	 
	 
    sign_extend se (
        .imm_in(Instruction[31:20]), // Extract the 12-bit immediate value from I-type
		  .selection(signexselec),
		  .imm_in2(Instruction[11:7]),
        .imm_out(imm_out) // Sign-extended immediate value for I-type
    );
	 

    mux_alu alu_mux (
        .a(imm_out),
        .b(RD2),
        .s(ALUSrc),
        .c(mux_out_alu)
    );
	 
	 
    top_decoder_module td (
        .Op(Instruction[6:0]), // Connect the opcode from the instruction
        .funct3(Instruction[14:12]), // Connect funct3 from the instruction
        .funct7(Instruction[31:25]), // Connect funct7 from the instruction
        .RegWrite(RegWrite), // Connect RegWrite
		  .ALUSrc(ALUSrc), // Connect ALUSrcf
		  .MemtoReg(MemtoReg),
		  .signexselec(signexselec),
		  .branch(branch),
		  .MemWrite(MemWrite),
        .ALU_control(main_ALU_control) // Connect main_ALU_control
    );

    ALU alu_inst (
        .a(RD1),
        .b(mux_out_alu),
        .ALU_control(main_ALU_control), // Connect main_ALU_control
        .zero_flag(zero_flag),
		  .sign_condition(sign_condition),
		  .unsign_condition(unsign_condition),
        .ALU_result(ALU_result)
    );
	 
	 
	 data_memory data_mem (
			  .clk(clk),
			  .WE(MemWrite),
			  .WD(RD2),
			  .A(ALU_result),
			  .load_type(Instruction[14:12]),
			  .RDm(DataMemOut)
		 );
		 
		 
  mux_aluordata mem_reg_mux (
        .a(ALU_result),
        .b(DataMemOut),
        .MemtoReg(MemtoReg),
        .c(mux_out2) // output to register file
    );	 

  branching branching(
		  
		  	.zero(zero_flag), // from ALU
			.sign(sign_condition),  //from ALU
			.unsign(unsign_condition), //from ALU
			.branch(branch), //from Control unit
			.funct3(Instruction[14:12]), // from instruction
			.PCSrc(PCSrc)  // to mux
    );	
	 
branch_adder branch_adder(

	.a(imm_out),
	.b(next_address),
	.sum(pc_mux)
	
	);

mux_pc mux_pc( // most left side mux
	.a(pc_mux),
	.b(next_address),
	.s(PCSrc),
	.c(pc_mux_out) // if a case in branch remove this 



);

	
endmodule

