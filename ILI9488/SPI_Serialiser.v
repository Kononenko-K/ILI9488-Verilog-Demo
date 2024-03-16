 module SPI_Serialiser (
 input  wire clk_in,
 input wire send_data,
 input wire [7:0] data_in,
 output reg data_out = 1'b0,
 output reg clk_out = 1'b0,
 output reg n_chip_enable = 1'b1
 );


 reg send_flag = 1'b0;
 reg transmit_finished = 1'b0;
 reg [2:0] counter = 3'b0; 
 
 
 always @ (posedge clk_in)
 begin
 	if (send_data == 1'b0) begin
 		transmit_finished = 1'b0;
 	end
 	if (send_data == 1'b1 && !transmit_finished) begin
 		send_flag = 1'b1;
 	end
 	if (send_flag == 1'b1) begin
 		n_chip_enable <= 1'b0;
 		data_out <= data_in[3'd7 - counter];
 		counter <= counter + 3'b1;
 		if (counter == 3'd7) begin
 			send_flag <= 1'b0;
 			if (send_data == 1'b1) begin
 				transmit_finished = 1'b1;
 			end
 		end
 	end
 	else if (counter == 3'b0) begin
 		n_chip_enable <= 1'b1;
 	end
 end
 
 always @* begin
 	if (n_chip_enable == 1'b0) begin
 		clk_out <= ~clk_in;
 	end
 	else begin
 		clk_out <= 1'b0;
 	end
 end
 	
 endmodule 
