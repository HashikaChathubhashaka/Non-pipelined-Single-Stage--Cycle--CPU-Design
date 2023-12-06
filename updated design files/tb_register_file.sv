module tb_register_file;

    // Inputs
    reg clk;
    reg WE3;
    reg [4:0] A1;
    reg [4:0] A2;
    reg [31:0] WD3;

    // Outputs
    wire [31:0] RD1;
    wire [31:0] RD2;

    // Instantiate the module under test
    register_file uut (
        .clk(clk),
        .WE3(WE3),
        .A1(A1),
        .A2(A2),
        .A3(0), // Set A3 to 0 for this testbench
        .WD3(WD3),
        .RD1(RD1),
        .RD2(RD2)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        clk = 0;
        WE3 = 1; // Enable writes

        // Set A1 and A2 addresses to read
        A1 = 0; // Address 0
        A2 = 4; // Address 4

        // Write data to A3
        WD3 = 32'h12345678;
        #10 WE3 = 0; // Disable writes

        // Read from A1 and A2
        #10;
        // RD1 should contain Register[2] (0x00000002)
        // RD2 should contain Register[4] (0x00000004)

        // Finish simulation after a while
        #100 $finish;
    end

    // Display results
    always @(posedge clk) begin
        $display("RD1 = %h, RD2 = %h", RD1, RD2);
    end

endmodule
