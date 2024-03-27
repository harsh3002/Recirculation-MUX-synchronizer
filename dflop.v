
`timescale 1ns/1ns

module dflop(
output reg out,
input reset,
input clk,
input data_in);

always@(posedge clk) begin
	if(reset) 
		out<=0;
	else 
		out<=data_in;
end

endmodule 
