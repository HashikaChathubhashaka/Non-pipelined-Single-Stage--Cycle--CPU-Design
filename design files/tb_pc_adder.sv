module tb_pc_adder;

  reg clk = 0;
  logic [15:0] current_address;
  logic [15:0] next_address;

  // Instantiate the pc_adder module
  pc_adder uut (
    .clk(clk),
    .current_address(current_address),
    .next_address(next_address)
  );

  // Clock generation
  always #5 clk = ~clk;  // Toggle the clock every 5 time units

  // Testbench stimulus
  initial begin
    $monitor("Time=%0t Current_Address=%h Next_Address=%h", $time, current_address, next_address);
    
    // Initialize inputs
    current_address = 16'h0000; // You can set the initial address to any value
    
    // Apply a few clock cycles
    #10; // Wait for 10 time units

    // You can add more test cases here by changing current_address values and waiting for more cycles

    $finish; // End simulation
  end

endmodule
