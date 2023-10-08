module tb_p_counter;

    // Inputs
    reg rst;
    reg clk;
    reg [15:0] PC_Next;

    // Outputs
    wire [15:0] PC;

    // Instantiate the module under test
    p_counter uut (
        .rst(rst),
        .clk(clk),
        .PC_Next(PC_Next),
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
        PC_Next = 16'h0000;

        // Release reset after some time
        #10 rst = 0;

        // Simulate PC updates
        #10 PC_Next = 16'h0004; // PC should increment by 4
        #10 PC_Next = 16'h0008; // PC should increment by 4
        #10 PC_Next = 16'h000C; // PC should increment by 4

        // Finish simulation after a while
        #100 $finish;
    end

    // Display results
    always @(posedge clk) begin
        $display("PC = %h", PC);
    end

endmodule
