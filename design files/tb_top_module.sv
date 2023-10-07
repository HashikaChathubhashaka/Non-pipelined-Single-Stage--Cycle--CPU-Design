module tb_top_module();

    reg clk;
    reg rst;
    wire [15:0] pc;

    // Instantiate the top module
    top_module uut (
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Reset generation
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0; // De-assert reset after 10 time units
    end

    // Stimulus generation and simulation
    initial begin
        // Wait for a few clock cycles before checking the result
        #20;

        // Perform some operations and check the PC value
        $display("Initial PC: %0d", pc);

        // Simulate some PC updates
        for (int i = 0; i < 5; i = i + 1) begin
            #5;
            $display("Cycle %0d: PC = %0d", i, pc);
        end

        // End simulation
        $finish;
    end

endmodule
