`default_nettype none
`timescale 1ns/1ps

module tb(
		input en,
		input rst,
		input [1:0] sel,
		output out_pwm
	);
	
	initial begin
		$dumpfile ("tb.vcd");
		$dumpvars (0,tb);
		#1;
	end
	
	wire [7:0] inputs = {4'b0, sel[1], sel[0], rst, en};
	wire [7:0] outputs;
	assign out_pwm = outputs[0];

	
	
	divisor_frec_ro_ff_d divisor_frec_ro_ff_d(
	.io_in (inputs),
	.io_out (outputs)
	);
endmodule
