module tb_mux_alu;
    reg [31:0] a, b;
    reg s;
    wire [31:0] c;

    // Instantiate the mux_alu module
    mux_alu uut (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    // Apply test inputs
    initial begin
        a = 32'h12345678;
        b = 32'h87654321;
        s = 1'b1; // Select input 'a'
        #10 s = 1'b0; // Select input 'b'
        #10 s = 1'b1; // Select input 'a'
        #10 s = 1'b0; // Select input 'b'
        $finish;
    end

    // Monitor the outputs
    always @(c) begin
        $display("s=%b a=%h b=%h c=%h", s, a, b, c);
    end
endmodule
