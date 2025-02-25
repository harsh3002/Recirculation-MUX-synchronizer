
`timescale 1ns/1ns

module mux_synchro(
output synchro_out,
input data_in,
input clk1,
input clk2,
input reset,
input enable);

wire dff_clk1; 		//storing input bit
wire dff_clk2;		//Storing output for Mux feedback
wire dual_sync_out;	//Output wire for dual flop synchronizer
wire mux_out;		//mux output

mux2_1 mux_inst(
.a(synchro_out),
.b(data_in),
.sel(dual_sync_out),
.out(mux_out));

dual_flop_synchro dual_sync_inst(
.sync_out(dual_sync_out),
.reset(reset),
.clk(clk2),
.data_in(dff_clk1));

dflop dff1_inst(
.data_in(enable),
.clk(clk1),
.reset(reset),
.out(dff_clk1));

dflop dff2_inst(
.data_in(mux_out),
.clk(clk2),
.reset(reset),
.out(dff_clk2));

assign synchro_out = dff_clk2;

endmodule
