module tb_ALU;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] ALU_control;

    // Outputs
    wire zero_flag;
    wire [31:0] ALU_result;

    // Instantiate the module under test
    ALU uut (
        .a(a),
        .b(b),
        .ALU_control(ALU_control),
        .zero_flag(zero_flag),
        .ALU_result(ALU_result)
    );

    // Stimulus generation
    initial begin
        // Test case 1: Addition
        a = 32'h00000001;
        b = 32'h00000002;
        ALU_control = 4'b0011; // Addition
        #10;
        
        // Test case 2: Another addition
        a = 32'h0000000A;
        b = 32'h0000000B;
        ALU_control = 4'b0011; // Addition
        #10;
        
        // Add more test cases for addition as needed
		  
        // Finish simulation after all test cases
        $finish;
    end

    // Display results
    always @(ALU_result or a or b or ALU_control) begin
        $display("ALU_result = %h, zero_flag = %b", ALU_result, zero_flag);
    end

endmodule
