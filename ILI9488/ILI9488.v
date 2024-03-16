// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"
// CREATED		"Sun Jan 21 21:04:31 2024"

module ILI9488(
	CLK_50M,
	CS,
	Reset,
	MOSI,
	CLK,
	clk_200k,
	clk_4m,
	DC
);


input wire	CLK_50M;
output wire	CS;
output wire	Reset;
output wire	MOSI;
output wire	CLK;
output wire	clk_200k;
output wire	clk_4m;
output wire	DC;

wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_20;





SPI_Serialiser	b2v_inst(
	.clk_in(SYNTHESIZED_WIRE_21),
	.send_data(SYNTHESIZED_WIRE_1),
	.data_in(SYNTHESIZED_WIRE_2),
	.data_out(MOSI),
	.clk_out(CLK)
	);

assign	clk_200k =  ~SYNTHESIZED_WIRE_22;


clock_divider	b2v_inst13(
	.clk_in(CLK_50M),
	.out1(SYNTHESIZED_WIRE_21),
	.out2(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst13.DIV1 = 10;
	defparam	b2v_inst13.DIV2 = 250;


LCD_init	b2v_inst2(
	.clk(SYNTHESIZED_WIRE_22),
	
	.send_data(SYNTHESIZED_WIRE_17),
	.data_command(SYNTHESIZED_WIRE_15),
	.disp_reset(Reset),
	.disp_cs(SYNTHESIZED_WIRE_13),
	.init_done(SYNTHESIZED_WIRE_23),
	.data_out(SYNTHESIZED_WIRE_19));


LCD_color_fill	b2v_inst3(
	.clk(SYNTHESIZED_WIRE_22),
	.init_done(SYNTHESIZED_WIRE_23),
	.reset_states(SYNTHESIZED_WIRE_7),
	.input_color(SYNTHESIZED_WIRE_8),
	.send_data(SYNTHESIZED_WIRE_18),
	.data_command(SYNTHESIZED_WIRE_16),
	.disp_cs(SYNTHESIZED_WIRE_14),
	.fill_done(SYNTHESIZED_WIRE_10),
	.reset_done(SYNTHESIZED_WIRE_11),
	.data_out(SYNTHESIZED_WIRE_20));

assign	clk_4m =  ~SYNTHESIZED_WIRE_21;


color_generator	b2v_inst5(
	.fill_done(SYNTHESIZED_WIRE_10),
	.reset_done(SYNTHESIZED_WIRE_11),
	.reset_states(SYNTHESIZED_WIRE_7),
	.output_color(SYNTHESIZED_WIRE_8));


bus_mux	b2v_inst8(
	.init_done(SYNTHESIZED_WIRE_23),
	.cs1(SYNTHESIZED_WIRE_13),
	.cs2(SYNTHESIZED_WIRE_14),
	.dc1(SYNTHESIZED_WIRE_15),
	.dc2(SYNTHESIZED_WIRE_16),
	.sd1(SYNTHESIZED_WIRE_17),
	.sd2(SYNTHESIZED_WIRE_18),
	.data_in1(SYNTHESIZED_WIRE_19),
	.data_in2(SYNTHESIZED_WIRE_20),
	.cs(CS),
	.dc(DC),
	.sd(SYNTHESIZED_WIRE_1),
	.data_out(SYNTHESIZED_WIRE_2));


endmodule
