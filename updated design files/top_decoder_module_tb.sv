`timescale 1ns / 1ps

module top_decoder_module_tb();

    reg [6:0] Op;
    reg [2:0] funct3;
    reg [6:0] funct7;
    wire RegWrite;
    wire [3:0] ALU_control;

    // Instantiate the top_decoder_module
    top_decoder_module td(
        .Op(Op),
        .funct3(funct3),
        .funct7(funct7),
        .RegWrite(RegWrite),
        .ALU_control(ALU_control)
    );

    // Test case
    initial begin
        // Initialize inputs
        Op = 7'b0110011; // R-type opcode
        funct3 = 3'b000; // funct3 for "add" instruction
        funct7 = 7'b0000000; // funct7 for "add" instruction

        // Apply a positive edge to the clock (if you have one)
        // #5 clk = ~clk;

        // Wait for some time to allow the modules to process
        #10;

        // Check the RegWrite and ALU_control values
        if (RegWrite && (ALU_control == 4'b0011)) begin
            $display("Test passed: ALU_control is 'add'");
        end else begin
            $display("Test failed: ALU_control is not 'add'");
        end

        // Finish the simulation
        $finish;
    end

endmodule
