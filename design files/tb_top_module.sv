module tb_top_module;

    reg rst;
    reg clk;
    wire [15:0] PC;
    wire [31:0] Instruction;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire [31:0] ALU_result; // Wire for ALU output
    wire zero_flag; // Wire for zero flag

    // Instantiate the top module
    top_module uut (
        .rst(rst),
        .clk(clk),
        .PC(PC),
        .Instruction(Instruction),
        .RD1(RD1),
        .RD2(RD2),
        .ALU_control(4'b0011), // Set ALU control to addition (4'b0011)
        .zero_flag(zero_flag),
        .ALU_result(ALU_result)
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
    // (You can apply inputs to rst and clk, and monitor PC, Instruction, RD1, RD2)

    // Display RD1, RD2, ALU output, and zero flag
    always @(RD1, RD2, ALU_result, zero_flag) begin
        $display("Instruction=%h RD1=%h RD2=%h ALU_result=%h Zero_Flag=%h", Instruction, RD1, RD2, ALU_result, zero_flag);
    end

    // Add additional test cases or stimulus as needed

    // Terminate the simulation
    initial begin
        #100 $finish;
    end

endmodule
