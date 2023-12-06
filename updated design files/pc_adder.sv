module pc_adder( input logic[15:0] current_address,
                output logic[15:0] next_address);

	assign next_address = current_address + 16'd4;
endmodule


//this is doing default programming counter adder

