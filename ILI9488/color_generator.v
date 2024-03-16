 module color_generator (
	input wire fill_done,
	input wire reset_done,
	output reg [15:0] output_color = 16'hf800,
	output reg reset_states
 );
 
 reg [1:0] counter = 2'd0;
 
 always @* begin
	if (fill_done) begin
		reset_states <= 1'b1;
	end
	else begin
		reset_states <= 1'b0;
	end
 end
 
 always @ (posedge reset_done)
 begin
   
	counter = counter + 2'd1;
	case(counter)
	0 : output_color <= 16'hf800;
	1 : output_color <= 16'h07e0;
	2 : output_color <= 16'h001f;
	3 : output_color <= 16'h0000;
	endcase
 end
 
 endmodule