
`timescale 1ns/1ns

module mux_synchro_tb();

wire synchro_out_tb;
reg data_in_tb;
reg clk1_tb;
reg clk2_tb;
reg reset_tb;
reg enable_tb;

mux_synchro dut(
.synchro_out(synchro_out_tb),
.data_in(data_in_tb),
.clk1(clk1_tb),
.clk2(clk2_tb),
.reset(reset_tb),
.enable(enable_tb));

initial begin
	clk1_tb<=0;
	forever #5 clk1_tb<=~clk1_tb;
end

initial begin
	clk2_tb<=0;
	forever #10 clk2_tb<=~clk2_tb;
end

initial begin
	    reset_tb<=1;
	#30 reset_tb<=0;
end

initial begin
	    	enable_tb<=1;	data_in_tb<=1;
	   #50  enable_tb<=1;	data_in_tb<=1;
	   #50  enable_tb<=1;	data_in_tb<=0;
	   #50  enable_tb<=0;	data_in_tb<=1;
	   #50  enable_tb<=1;	data_in_tb<=0;
	   #50  enable_tb<=1;	data_in_tb<=1;
	   #50  enable_tb<=0;	data_in_tb<=0;
	   #50  enable_tb<=1;	data_in_tb<=0;
	   
end

endmodule

