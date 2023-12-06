module tb_pc_adder;

    // Inputs
    reg [15:0] current_address;

    // Outputs
    wire [15:0] next_address;

    // Instantiate the module under test
    pc_adder uut (
        .current_address(current_address),
        .next_address(next_address)
    );

    // Stimulus generation
    initial begin
        // Initialize inputs
        current_address = 16'h0000; // Start with address 0

        // Apply some test vectors
        #10 current_address = 16'h0004; // Add 4 to address
        #10 current_address = 16'h0008; // Add 4 again
        #10 current_address = 16'h000C; // Add 4 again

        // Finish simulation after a while
        #100 $finish;
    end

    // Display results
    always @(next_address) begin
        $display("current_address = %h, next_address = %h", current_address, next_address);
    end

endmodule
