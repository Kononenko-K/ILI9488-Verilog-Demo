 module LCD_color_fill (
 input  wire clk,
 input wire init_done,
 input wire reset_states,
 input wire [15:0] input_color,
 output reg [7:0] data_out = 8'b0,
 output reg send_data = 1'b0,
 output reg data_command = 1'b0,
 output reg disp_cs = 1'b1,
 output reg fill_done = 1'b0,
 output reg reset_done = 1'b0
 );
 
 `include "data_command_tasks.v"
 
 reg [31:0] main_counter = 32'b0; 
 reg [8:0] resolution_counter_x = 9'd319; 
 reg [8:0] resolution_counter_y = 9'd479; 
 reg [1:0] sub_counter = 2'd2; 
 reg blocking_flag = 1'b0;
 
 
 always @ (posedge clk)
 begin
 	if (init_done) begin
 	 	if (main_counter < 500000) begin
 	 		main_counter <= main_counter + 1;
 	 	end
 	 	if (main_counter >= 12) begin
 			
 	 	end
 	 	if (main_counter >= 12) begin
 	 		if (!blocking_flag) begin
 		 		if (sub_counter < 2) begin
 					sub_counter = sub_counter + 1;
 				end
 				else begin
 					sub_counter = 2'b0;
 			 		if (resolution_counter_y < 479) begin
 			 			resolution_counter_y <= resolution_counter_y + 1;
 			 		end
 			 		else if (resolution_counter_y == 479) begin
 			 			resolution_counter_y = 0;
 			 			if (resolution_counter_x < 319) begin
 			 				resolution_counter_x <= resolution_counter_x + 1;
 			 			end
 			 			else begin
 			 				resolution_counter_x = 0;
 			 				if (main_counter != 12) begin
 			 					blocking_flag = 1'b1;
 			 					data_command = 1'b0;
 			 				end
 			 			end
 			 		end
 			 	end
 			 case(sub_counter)
 			 	0 : write_data((input_color>>8)&8'hF8, data_out, data_command); 
 				1 : write_data((input_color>>3)&8'hFC, data_out, data_command); 
 				2 : write_data(input_color<<3, data_out, data_command); 
 			endcase
 			end	 
 	 	end
 	 	case(main_counter)
 	 	0 : begin
 	 		disp_cs <= 1'b0;
 	 		fill_done <= 1'b0;
 			reset_done <= 1'b0;
 	 	    end
 	 	1 : write_com(8'h2a, data_out, data_command); 
 		2 : write_data(0>>8, data_out, data_command); 
 		3 : write_data(0, data_out, data_command); 
 		4 : write_data(9'd320>>8, data_out, data_command); 
 		5 : write_data(9'd320, data_out, data_command); 
 	  	6 : write_com(8'h2b, data_out, data_command); 
 		7 : write_data(0>>8, data_out, data_command); 
 		8 : write_data(0, data_out, data_command); 
 		9 : write_data(9'd480>>8, data_out, data_command); 
 		10 : write_data(9'd480, data_out, data_command); 
 		11 : write_com(8'h2c, data_out, data_command);
 		460812: disp_cs <= 1'b1; //320*480*3+11+1
 		460813: fill_done <= 1'b1;
 	 	endcase
 	 end
 	 
 	 if (reset_states) begin
 	 	main_counter <= 32'b0;
 	 	resolution_counter_x <= 9'd319; 
 		resolution_counter_y <= 9'd479; 
 		sub_counter <= 2'd2; 
 	 	blocking_flag <= 1'b0;
 		data_out <= 8'b0;
 		data_command <= 1'b0;
 		disp_cs <= 1'b1;
 		fill_done <= 1'b0;
 		reset_done <= 1'b1;
 	 end
 end
 
 always @* begin
 	if (init_done) begin
 		if (main_counter - 1 >= 1 && main_counter - 1 <= 11) begin
 			send_data <= ~clk;
 		end
 		else if (!blocking_flag) begin
 			send_data <= ~clk;
 		end
 		else begin
 			send_data <= 1'b0;
 		end
 	end
 end
 endmodule

