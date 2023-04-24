`default_nettype none
`timescale 1ns/1ps

/////// PWM ///////

module divisor_frec_ro_ff_d(

	io_in,
	io_out

);

	input wire [7:0] io_in;
	output wire [7:0] io_out;
	assign io_out[7:1] = 7'b0;



//////////////////// delay_out[7] ////////////////////

	wire ro_7_2_clk_ff_0;
	wire nq_ffd_0_2_d_ffd_0;
	wire q_ffd_0_2_clk_ffd_1;
	
	wire nq_ffd_1_2_d_ffd_1;
	wire q_ffd_1_2_clk_ffd_2;	

	wire nq_ffd_2_2_d_ffd_2;
	wire q_ffd_2_2_clk_ffd_3;
	
	wire nq_ffd_3_2_d_ffd_3;
	wire q_ffd_3_2_clk_ffd_4;

	wire nq_ffd_4_2_d_ffd_4;
	wire q_ffd_4_2_clk_ffd_5;

	wire nq_ffd_5_2_d_ffd_5;
	wire q_ffd_5_2_clk_ffd_6;

	wire nq_ffd_6_2_d_ffd_6;
	wire q_ffd_6_2_clk_ffd_7;

	wire nq_ffd_7_2_d_ffd_7;
	wire q_ffd_7_2_clk_ffd_8;

//////////////////// delay_out[40] ////////////////////

	wire ro_40_2_clk_ff_8;
	wire nq_ffd_8_2_d_ffd_8;
	wire q_ffd_8_2_clk_ffd_9;

	wire nq_ffd_9_2_d_ffd_9;
	wire q_ffd_9_2_clk_ffd_10;

	wire nq_ffd_10_2_d_ffd_10;
	wire q_ffd_10_2_clk_ffd_11;

	wire nq_ffd_11_2_d_ffd_11;
	wire q_ffd_11_2_clk_ffd_12;

	wire nq_ffd_12_2_d_ffd_12;	
	wire q_ffd_12_2_clk_ffd_13;

	wire nq_ffd_13_2_d_ffd_13;	
	wire q_ffd_13_2_clk_ffd_14;	

	wire nq_ffd_14_2_d_ffd_14;	
	wire q_ffd_14_2_clk_ffd_15;
	
	wire nq_ffd_15_2_d_ffd_15;	
	
//////////////////// delay_out[80] ////////////////////

	wire ro_80_2_clk_ff_16;
	wire nq_ffd_16_2_d_ffd_16;
	wire q_ffd_16_2_clk_ffd_17;

	wire nq_ffd_17_2_d_ffd_17;
	wire q_ffd_17_2_clk_ffd_18;

	wire nq_ffd_18_2_d_ffd_18;
	wire q_ffd_18_2_clk_ffd_19;

	wire nq_ffd_19_2_d_ffd_19;
	wire q_ffd_19_2_clk_ffd_20;

	wire nq_ffd_20_2_d_ffd_20;	
	wire q_ffd_20_2_clk_ffd_21;

	wire nq_ffd_21_2_d_ffd_21;	
	wire q_ffd_21_2_clk_ffd_22;	

	wire nq_ffd_22_2_d_ffd_22;	
	wire q_ffd_22_2_clk_ffd_23;
	
	wire nq_ffd_23_2_d_ffd_23;

//////////////////// delay_out[120] ////////////////////
		
	wire ro_120_2_clk_ff_24;
	wire nq_ffd_24_2_d_ffd_24;
	wire q_ffd_24_2_clk_ffd_25;

	wire nq_ffd_25_2_d_ffd_25;
	wire q_ffd_25_2_clk_ffd_26;

	wire nq_ffd_26_2_d_ffd_26;
	wire q_ffd_26_2_clk_ffd_27;

	wire nq_ffd_27_2_d_ffd_27;
	wire q_ffd_27_2_clk_ffd_28;

	wire nq_ffd_28_2_d_ffd_28;	
	wire q_ffd_28_2_clk_ffd_29;

	wire nq_ffd_29_2_d_ffd_29;	
	wire q_ffd_29_2_clk_ffd_30;	

	wire nq_ffd_30_2_d_ffd_30;	
	wire q_ffd_30_2_clk_ffd_31;
	
	wire nq_ffd_31_2_d_ffd_31;	
		
	
	wire out_div_7;
	wire out_div_40;
	wire out_div_80;
	wire out_div_120;
	wire out_mux4;
	wire out_ro;
		
//	reg out_div_7;
//	reg out_div_40;	
//	reg out_div_80;
//	reg out_div_120;				
	reg out_pwm;
	assign io_out[0] = out_pwm;
//	assign io_out[1] = out_div_7;
//	assign io_out[2] = out_div_40;
//	assign io_out[3] = out_div_80;
//	assign io_out[4] = out_div_120;
	
	ring_osc ring_osc_0 (
	.en(io_in[0]),
	.out(out_ro),
//	.out_set(ring_2_ff_set),
	.out0(ro_120_2_clk_ff_24),
	.out1(ro_80_2_clk_ff_16),
	.out2(ro_40_2_clk_ff_8),
	.out3(ro_7_2_clk_ff_0)
	);

//////////////////// delay_out[7] ////////////////////

	ff_d ff_d_0 (
	.d(nq_ffd_0_2_d_ffd_0),
	.clk(ro_7_2_clk_ff_0),
	.rst(io_in[1]),
	.q(q_ffd_0_2_clk_ffd_1),
	.nq(nq_ffd_0_2_d_ffd_0)		
	);

	ff_d ff_d_1 (
	.d(nq_ffd_1_2_d_ffd_1),
	.clk(q_ffd_0_2_clk_ffd_1),
	.rst(io_in[1]),
	.q(q_ffd_1_2_clk_ffd_2),
	.nq(nq_ffd_1_2_d_ffd_1)		
	);
	
	ff_d ff_d_2 (
	.d(nq_ffd_2_2_d_ffd_2),
	.clk(q_ffd_0_2_clk_ffd_1),
	.rst(io_in[1]),
	.q(q_ffd_2_2_clk_ffd_3),
	.nq(nq_ffd_2_2_d_ffd_2)		
	);	

	ff_d ff_d_3 (
	.d(nq_ffd_3_2_d_ffd_3),
	.clk(q_ffd_2_2_clk_ffd_3),
	.rst(io_in[1]),
	.q(q_ffd_3_2_clk_ffd_4),
	.nq(nq_ffd_3_2_d_ffd_3)		
	);
	
	ff_d ff_d_4 (
	.d(nq_ffd_4_2_d_ffd_4),
	.clk(q_ffd_3_2_clk_ffd_4),
	.rst(io_in[1]),
	.q(q_ffd_4_2_clk_ffd_5),
	.nq(nq_ffd_4_2_d_ffd_4)		
	);	

	ff_d ff_d_5 (
	.d(nq_ffd_5_2_d_ffd_5),
	.clk(q_ffd_4_2_clk_ffd_5),
	.rst(io_in[1]),
	.q(q_ffd_5_2_clk_ffd_6),
	.nq(nq_ffd_5_2_d_ffd_5)		
	);	
	
	ff_d ff_d_6 (
	.d(nq_ffd_6_2_d_ffd_6),
	.clk(q_ffd_5_2_clk_ffd_6),
	.rst(io_in[1]),
	.q(q_ffd_6_2_clk_ffd_7),
	.nq(nq_ffd_6_2_d_ffd_6)		
	);	

	ff_d ff_d_7 (
	.d(nq_ffd_7_2_d_ffd_7),
	.clk(q_ffd_6_2_clk_ffd_7),
	.rst(io_in[1]),
	.q(out_div_7),
	.nq(nq_ffd_7_2_d_ffd_7)		
	);

//////////////////// delay_out[40] ////////////////////

	ff_d ff_d_8 (
	.d(nq_ffd_8_2_d_ffd_8),
	.clk(ro_40_2_clk_ff_8),
	.rst(io_in[1]),
	.q(q_ffd_8_2_clk_ffd_9),
	.nq(nq_ffd_8_2_d_ffd_8)		
	);

	ff_d ff_d_9 (
	.d(nq_ffd_9_2_d_ffd_9),
	.clk(q_ffd_8_2_clk_ffd_9),
	.rst(io_in[1]),
	.q(q_ffd_9_2_clk_ffd_10),
	.nq(nq_ffd_9_2_d_ffd_9)		
	);
	
	ff_d ff_d_10 (
	.d(nq_ffd_10_2_d_ffd_10),
	.clk(q_ffd_9_2_clk_ffd_10),
	.rst(io_in[1]),
	.q(q_ffd_10_2_clk_ffd_11),
	.nq(nq_ffd_10_2_d_ffd_10)		
	);	

	ff_d ff_d_11 (
	.d(nq_ffd_11_2_d_ffd_11),
	.clk(q_ffd_10_2_clk_ffd_11),
	.rst(io_in[1]),
	.q(q_ffd_11_2_clk_ffd_12),
	.nq(nq_ffd_11_2_d_ffd_11)		
	);
	
	ff_d ff_d_12 (
	.d(nq_ffd_12_2_d_ffd_12),
	.clk(q_ffd_11_2_clk_ffd_12),
	.rst(io_in[1]),
	.q(q_ffd_12_2_clk_ffd_13),
	.nq(nq_ffd_12_2_d_ffd_12)		
	);	

	ff_d ff_d_13 (
	.d(nq_ffd_13_2_d_ffd_13),
	.clk(q_ffd_12_2_clk_ffd_13),
	.rst(io_in[1]),
	.q(q_ffd_13_2_clk_ffd_14),
	.nq(nq_ffd_13_2_d_ffd_13)		
	);	
	
	ff_d ff_d_14 (
	.d(nq_ffd_14_2_d_ffd_14),
	.clk(q_ffd_13_2_clk_ffd_14),
	.rst(io_in[1]),
	.q(q_ffd_14_2_clk_ffd_15),
	.nq(nq_ffd_14_2_d_ffd_14)		
	);	

	ff_d ff_d_15 (
	.d(nq_ffd_15_2_d_ffd_15),
	.clk(q_ffd_14_2_clk_ffd_15),
	.rst(io_in[1]),
	.q(out_div_40),
	.nq(nq_ffd_15_2_d_ffd_15)		
	);


//////////////////// delay_out[80] ////////////////////

	ff_d ff_d_16 (
	.d(nq_ffd_16_2_d_ffd_16),
	.clk(ro_80_2_clk_ff_16),
	.rst(io_in[1]),
	.q(q_ffd_16_2_clk_ffd_17),
	.nq(nq_ffd_16_2_d_ffd_16)		
	);

	ff_d ff_d_17 (
	.d(nq_ffd_17_2_d_ffd_17),
	.clk(q_ffd_16_2_clk_ffd_17),
	.rst(io_in[1]),
	.q(q_ffd_17_2_clk_ffd_18),
	.nq(nq_ffd_17_2_d_ffd_17)		
	);
	
	ff_d ff_d_18 (
	.d(nq_ffd_18_2_d_ffd_18),
	.clk(q_ffd_17_2_clk_ffd_18),
	.rst(io_in[1]),
	.q(q_ffd_18_2_clk_ffd_19),
	.nq(nq_ffd_18_2_d_ffd_18)		
	);	

	ff_d ff_d_19 (
	.d(nq_ffd_19_2_d_ffd_19),
	.clk(q_ffd_18_2_clk_ffd_19),
	.rst(io_in[1]),
	.q(q_ffd_19_2_clk_ffd_20),
	.nq(nq_ffd_19_2_d_ffd_19)		
	);
	
	ff_d ff_d_20 (
	.d(nq_ffd_20_2_d_ffd_20),
	.clk(q_ffd_19_2_clk_ffd_20),
	.rst(io_in[1]),
	.q(q_ffd_20_2_clk_ffd_21),
	.nq(nq_ffd_20_2_d_ffd_20)		
	);	

	ff_d ff_d_21 (
	.d(nq_ffd_21_2_d_ffd_21),
	.clk(q_ffd_20_2_clk_ffd_21),
	.rst(io_in[1]),
	.q(q_ffd_21_2_clk_ffd_22),
	.nq(nq_ffd_21_2_d_ffd_21)		
	);	
	
	ff_d ff_d_22 (
	.d(nq_ffd_22_2_d_ffd_22),
	.clk(q_ffd_21_2_clk_ffd_22),
	.rst(io_in[1]),
	.q(q_ffd_22_2_clk_ffd_23),
	.nq(nq_ffd_22_2_d_ffd_22)		
	);	

	ff_d ff_d_23 (
	.d(nq_ffd_23_2_d_ffd_23),
	.clk(q_ffd_22_2_clk_ffd_23),
	.rst(io_in[1]),
	.q(out_div_80),
	.nq(nq_ffd_23_2_d_ffd_23)		
	);

//////////////////// delay_out[120] ////////////////////

	ff_d ff_d_24 (
	.d(nq_ffd_24_2_d_ffd_24),
	.clk(ro_120_2_clk_ff_24),
	.rst(io_in[1]),
	.q(q_ffd_24_2_clk_ffd_25),
	.nq(nq_ffd_24_2_d_ffd_24)		
	);

	ff_d ff_d_25 (
	.d(nq_ffd_25_2_d_ffd_25),
	.clk(q_ffd_24_2_clk_ffd_25),
	.rst(io_in[1]),
	.q(q_ffd_25_2_clk_ffd_26),
	.nq(nq_ffd_25_2_d_ffd_25)		
	);
	
	ff_d ff_d_26 (
	.d(nq_ffd_26_2_d_ffd_26),
	.clk(q_ffd_25_2_clk_ffd_26),
	.rst(io_in[1]),
	.q(q_ffd_26_2_clk_ffd_27),
	.nq(nq_ffd_26_2_d_ffd_26)		
	);	

	ff_d ff_d_27 (
	.d(nq_ffd_27_2_d_ffd_27),
	.clk(q_ffd_26_2_clk_ffd_27),
	.rst(io_in[1]),
	.q(q_ffd_27_2_clk_ffd_28),
	.nq(nq_ffd_27_2_d_ffd_27)		
	);
	
	ff_d ff_d_28 (
	.d(nq_ffd_28_2_d_ffd_28),
	.clk(q_ffd_27_2_clk_ffd_28),
	.rst(io_in[1]),
	.q(q_ffd_28_2_clk_ffd_29),
	.nq(nq_ffd_28_2_d_ffd_28)		
	);	

	ff_d ff_d_29 (
	.d(nq_ffd_29_2_d_ffd_29),
	.clk(q_ffd_28_2_clk_ffd_29),
	.rst(io_in[1]),
	.q(q_ffd_29_2_clk_ffd_30),
	.nq(nq_ffd_29_2_d_ffd_29)		
	);	
	
	ff_d ff_d_30 (
	.d(nq_ffd_30_2_d_ffd_30),
	.clk(q_ffd_29_2_clk_ffd_30),
	.rst(io_in[1]),
	.q(q_ffd_30_2_clk_ffd_31),
	.nq(nq_ffd_30_2_d_ffd_30)		
	);	

	ff_d ff_d_31 (
	.d(nq_ffd_31_2_d_ffd_31),
	.clk(q_ffd_30_2_clk_ffd_31),
	.rst(io_in[1]),
	.q(out_div_120),
	.nq(nq_ffd_31_2_d_ffd_31)		
	);


	mux4 mux4_0 (
		.d0(out_div_7),
		.d1(out_div_40),
		.d2(out_div_80),
		.d3(out_div_120),
		.sel(io_in[3:2]),
		.out_mux(out_mux4)

	);

	ff_sr ff_sr_0 (
		.set(out_ro),	
		.reset(out_mux4),
		.q(out_pwm)
	);

endmodule

module ff_d(
	d,
	clk,
	rst,
	q,
	nq
);


input wire d;
input wire clk;
input wire rst;
output wire q;
output wire nq;


reg temp;
reg temp2;

assign q = temp;
assign nq = temp2;

always @(posedge clk, posedge rst) begin
	if(rst == 1'b1)
	begin
	temp <= 1'b0;
	temp2 <= 1'b1;
	end
	else begin
	temp <= d;
  	temp2 <= ~temp;
  	end
end

endmodule
	
/////// Ring Oscillator ///////

//module inv_with_delay(
//	input A, 
//	output Y
//);

//`ifdef COCOTB_SIM
//assign #0.02 Y=~A;
//assign #200 Y=~A;
//`else
//sky130_fd_sc_hd_inv_2 inv(.A(A),.Y(Y));
//`endif
//endmodule

module not_cell (
    input wire in,
    output wire out
    );

    assign out = !in;
endmodule

//module nand2_with_delay(
//	input A,
//	input B, 
//	output Y
//);

//`ifdef COCOTB_SIM
//assign #0.05 Y=~(A & B);
//assign #500 Y=~(A & B);
//`else
//sky130_fd_sc_hd_nand2_2 inv(.A(A),.B(B),.Y(Y));
//`endif
//endmodule

module nand_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = !(a&b);
endmodule


module ring_osc(

	en,
	out,
//	out_set,
	out0,
	out1,
	out2,
	out3

);

input wire en;
output wire out;
//output wire out_set;
output wire out0;
output wire out1;
output wire out2;
output wire out3;


localparam NUM_INVERTERS = 150;
//localparam NUM_INVERTERS = 16;


wire [NUM_INVERTERS-1:0] delay_in, delay_out;
wire out;
//inv_with_delay idelay [NUM_INVERTERS-1:0](
//	.A(delay_in),
//	.Y(delay_out)
not_cell idelay [NUM_INVERTERS-1:0](
	.in(delay_in),
	.out(delay_out)
);
assign delay_in = {delay_out[NUM_INVERTERS-2:0],out};
//nand2_with_delay nand2_with_delay(.A(en), .B(delay_out[NUM_INVERTERS-1]), .Y(out));
	nand_cell nand_delay(.a(en), .b(delay_out[NUM_INVERTERS-1]), .out(out));
//reg out;

/*assign io_out[0] = out;
assign io_out[7:1] = 7'b0000000;*/

reg temp_ro0;
reg temp_ro1;
reg temp_ro2;
reg temp_ro3;
//reg temp_set;

assign out0 = temp_ro0;
assign out1 = temp_ro1;
assign out2 = temp_ro2;
assign out3 = temp_ro3;
//assign out_set = temp_set;


assign temp_ro0 =delay_out[120];
assign temp_ro1 =delay_out[80];
assign temp_ro2 =delay_out[40];
//assign temp_ro3 =delay_out[NUM_INVERTERS-1];
assign temp_ro3 =delay_out[7];
//assign temp_set = delay_out[3];


endmodule

/////// MUX 4 ///////

module mux4(

	d0,
	d1,
	d2,
	d3,
	sel,
	out_mux
);


/** The inputs are defined here **/

input wire d0;
input wire d1;
input wire d2;
input wire d3;
input wire [1:0] sel;
output wire out_mux;

reg temp;
assign out_mux = temp;

always@(*)
	begin
		case(sel)
		0:temp <= d0;
		1:temp <= d1;
		2:temp <= d2;
		3:temp <= d3;
		default: temp=1'b0;
		endcase
	end
	
endmodule

/////// FF-SR ///////

module ff_sr(
	set,
	reset,
	q
);

input wire set;
input wire reset;
output wire q;

reg temp2;

assign q = temp2;


always@(set, reset)
	begin
		case( {reset, set})
		0:temp2 <= temp2;
		1:temp2 <= 1'b1; 
		2:temp2 <= 1'b0; 
		3:temp2 <= 1'bx;
		default:temp2 <= 1'bx; 
		endcase
	end
endmodule
