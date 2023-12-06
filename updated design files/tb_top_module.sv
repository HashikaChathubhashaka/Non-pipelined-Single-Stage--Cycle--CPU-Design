module tb_top_module;

    reg rst;
    reg clk;
    // Define your wires
    wire [15:0] PC;
    wire [31:0] Instruction;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire [3:0] ALU_control;
    wire zero_flag;
    wire [31:0] ALU_result;
    wire [31:0] DataMemOut;
    wire [31:0] mux_out2;
    wire MemtoReg;
	 wire PCSrc;
    wire RegWrite;

    // Instantiate the top module
    top_module uut (
        .rst(rst),
        .clk(clk),
        .PC(PC),
        .Instruction(Instruction),
        .RD1(RD1),
        .RD2(RD2),
        .ALU_control(ALU_control),
        .zero_flag(zero_flag),
        .ALU_result(ALU_result),
        // Include mux_out2 in the testbench connections
        .mux_out2(mux_out2),
        .DataMemOut(DataMemOut),
        .RegWrite(RegWrite),
		  .PCSrc(PCSrc),
        .MemtoReg(MemtoReg)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Reset generation
    initial begin
        rst = 1'b1;
        clk = 1'b0;

        // Apply reset
        #10 rst = 1'b0;
    end

    // Simulate instructions here, if needed

    // Display signals including mux_out2
    always @(PC, Instruction, RD1, RD2, ALU_result, ALU_control, RegWrite, DataMemOut, mux_out2 ) begin
        #1 $display("PC=%h Instruction=%h RD1=%h RD2=%h ALU_result=%h ALU_control=%h RegWrite=%h data_mem_out=%h right_mux=%h  MemtoReg=%h zero=%h PCSrc=%h" , PC, Instruction, RD1, RD2, ALU_result, ALU_control, RegWrite,DataMemOut, mux_out2,MemtoReg,zero_flag ,PCSrc);
    end

    // Terminate the simulation
    initial begin
        #300 $finish;
    end

endmodule
