module tb_top_module;

    reg rst;
    reg clk;
    wire [15:0] PC;
    wire [31:0] Instruction;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire [3:0] ALU_control;
    wire zero_flag;
    wire [31:0] ALU_result;
    wire RegWrite;
    wire [3:0] main_ALU_control;

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
        .RegWrite(RegWrite)
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
    // (You can apply inputs to rst and clk, and monitor PC, Instruction, RD1, RD2, ALU_control, zero_flag, ALU_result, RegWrite, and main_ALU_control)

    // Display PC, Instruction, RD1, RD2, ALU_result, ALU_control, RegWrite, and main_ALU_control
    always @(PC, Instruction, RD1, RD2, ALU_result, ALU_control, RegWrite, main_ALU_control) begin
         #1 $display("PC=%h Instruction=%h RD1=%h RD2=%h ALU_result=%h ALU_control=%h RegWrite=%h main_ALU_control=%h", PC, Instruction, RD1, RD2, ALU_result, ALU_control, RegWrite, main_ALU_control);
    end

    // Add additional test cases or stimulus as needed

    // Terminate the simulation
    initial begin
        #100 $finish;
    end

endmodule
