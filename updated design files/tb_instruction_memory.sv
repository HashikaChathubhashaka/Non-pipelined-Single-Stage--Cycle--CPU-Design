module tb_instruction_memory;

    // Inputs
    reg [15:0] A; // Address input

    // Outputs
    wire [31:0] RD; // Data output

    // Instantiate the module under test
    instruction_memory uut (
        .A(A),
        .RD(RD)
    );

    // Stimulus generation
    initial begin
        // Initialize inputs
         A = 16'h0000; // Start with address 0

        // Read from different addresses

        #10 A = 16'h0004;

		  #10 A = 16'h0008;

		  #10 A = 16'h000C;
		  

        // because Address is increment by 4

        // Finish simulation after a while
        #100 $finish;
    end

    // Display results
    always @(A) begin
        $display("A = %h, RD = %h", A, RD);
    end

endmodule
