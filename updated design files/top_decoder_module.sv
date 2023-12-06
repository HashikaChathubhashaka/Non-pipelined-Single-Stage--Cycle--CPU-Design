module top_decoder_module(
    input [6:0] Op, // opcode
    input [2:0] funct3, // instruction funct3 field
    input [6:0] funct7, // instruction funct7 field
    output logic RegWrite, // register write enable
    output logic ALUSrc, // ALU source select
    output [3:0] ALU_control, // output for ALU
    output logic MemWrite, // Memory write enable for I-type (store) instructions
    output logic MemtoReg, // Memory to register data path control signal
    output logic [1:0] signexselec, // Sign-extend mux selection
    output logic branch // Branching instruction	 
);

    logic [1:0] ALUOp; // Intermediate signal for ALU operation

    // Instantiate the main_decoder module
    main_decoder md(
        .Op(Op),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .signexselec(signexselec),
		  .funct3(funct3),
        .branch(branch)

    );

    // Instantiate the ALU_decoder module
    ALU_decoder ad(
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7(funct7),
		  .op(Op),
        .ALU_control(ALU_control)
    );

endmodule
