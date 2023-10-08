module tb_top_module;

    // Inputs
    reg rst;
    reg clk;

    // Outputs
    wire [15:0] PC;

    // Instantiate the module under test
    top_module uut (
        .rst(rst),
        .clk(clk),
        .PC(PC)
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
        #10 rst = 0;

        // Simulate automatic PC increment
        // PC should increment by 4 on each clock cycle
        #10; // PC should be 0x0004
        #10; // PC should be 0x0008
        #10; // PC should be 0x000C
        #10; // PC should be 0x0010

        // Finish simulation after a while
        #100 $finish;
    end

    // Display results
    always @(posedge clk) begin
        $display("PC = %h", PC);
    end

endmodule
