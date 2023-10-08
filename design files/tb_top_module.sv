module tb_top_module;

    // Inputs
    reg rst;
    reg clk;

    // Outputs
    wire [15:0] PC;
    wire [31:0] Instruction;

    // Instantiate the module under test
    top_module uut (
        .rst(rst),
        .clk(clk),
        .PC(PC),
        .Instruction(Instruction)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        rst = 1; // Apply reset initially
        clk = 0;

        // Release reset after some time
        #5 rst = 0;

        // Simulate PC auto-increment
        // PC should increment by 4 on each clock cycle
        #10; // PC should be 0x0004
        #10; // PC should be 0x0008
        #10; // PC should be 0x000C
        #10; // PC should be 0x0010

        // Simulate instruction fetching
        // The instruction memory is initialized in your module
        // You can read the Instruction output here
        #10; // Instruction 0x00000020
        #10; // Instruction 0x00000021
        #10; // Instruction 0x00000031
        #10; // Instruction 0x00000005

        // Finish simulation after a while
        #100 $finish;
    end

    // Display results
    always @(posedge clk) begin
        $display("PC = %h, Instruction = %h", PC, Instruction);
    end

endmodule
