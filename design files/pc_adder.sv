module pc_adder( input wire clk,
                input logic[31:0] current_address,
                output logic[31:0] next_address);

    always_ff @(posedge clk) begin

        next_address <= current_address + 4; // for default counter

    end
endmodule


//this is doing default programming counter adder




