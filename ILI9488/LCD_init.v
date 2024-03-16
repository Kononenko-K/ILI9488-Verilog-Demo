 module LCD_init (
 input  wire clk,
 input wire start_init,
 output reg [7:0] data_out = 8'b0,
 output reg send_data = 1'b0,
 output reg data_command = 1'b0,
 output reg disp_reset = 1'b0,
 output reg disp_cs = 1'b1, 
 output reg init_done = 1'b0
 );
 
 `include "data_command_tasks.v"
 
 reg [31:0] counter = 32'b0; 
 
 always @ (posedge clk)
 begin
 	if (counter < 100000) begin
 		counter <= counter + 1;
 	end
 	case(counter)
 	0 : begin 
	    disp_reset <= 1'b1;
		 disp_cs <= 1'b1;
		 init_done <= 1'b0;
		 end
 	2499 : disp_reset <= 1'b0; //500 * 5
 	9999 : disp_reset <= 1'b1; //500 * 15
 	17900 : disp_cs <= 1'b0;
 	17999 : write_com(8'hF7, data_out, data_command);
 	18000 : write_data(8'hA9, data_out, data_command);
	18000 + 1 : write_data(8'h51, data_out, data_command); 
	18000 + 2: write_data(8'h2C, data_out, data_command); 
	18000 + 3: write_data(8'h82, data_out, data_command);  
	18000 + 4: write_com(8'hC0, data_out, data_command);  
	18000 + 5: write_data(8'h11, data_out, data_command); 
	18000 + 6: write_data(8'h09, data_out, data_command); 
	18000 + 7: write_com(8'hC1, data_out, data_command);  
	18000 + 8: write_data(8'h41, data_out, data_command); 
	18000 + 9: write_com(8'hC5, data_out, data_command);  
	18000 + 10: write_data(8'h00, data_out, data_command); 
	18000 + 11: write_data(8'h0A, data_out, data_command); 
	18000 + 12: write_data(8'h80, data_out, data_command);
	18000 + 13: write_com(8'hB1, data_out, data_command);  
	18000 + 14: write_data(8'hB0, data_out, data_command); 
	18000 + 15: write_data(8'h11, data_out, data_command); 
	18000 + 16: write_com(8'hB4, data_out, data_command);  
	18000 + 17: write_data(8'h02, data_out, data_command); 
	18000 + 18: write_com(8'hB6, data_out, data_command);    
	18000 + 19: write_data(8'h02, data_out, data_command);
	18000 + 20: write_data(8'h22, data_out, data_command);  
	18000 + 21: write_com(8'hB7, data_out, data_command);    
	18000 + 22: write_data(8'hC6, data_out, data_command);  
	18000 + 23: write_com(8'hBE, data_out, data_command);    
	18000 + 24: write_data(8'h00, data_out, data_command);   
	18000 + 25: write_data(8'h04, data_out, data_command); 
	18000 + 26: write_com(8'hE9, data_out, data_command);    
	18000 + 27: write_data(8'h00, data_out, data_command);   
	18000 + 28: write_com(8'h36, data_out, data_command);  
	18000 + 29: write_data(8'h08, data_out, data_command);   
	18000 + 30: write_com(8'h3A, data_out, data_command);    
	18000 + 31: write_data(8'h66, data_out, data_command); 
	18000 + 32: write_com(8'hE0, data_out, data_command);    
	18000 + 33: write_data(8'h00, data_out, data_command);  
	18000 + 34: write_data(8'h07, data_out, data_command); 
	18000 + 35: write_data(8'h10, data_out, data_command); 
	18000 + 36: write_data(8'h09, data_out, data_command); 
	18000 + 37: write_data(8'h17, data_out, data_command); 
	18000 + 38: write_data(8'h0B, data_out, data_command); 
	18000 + 39: write_data(8'h41, data_out, data_command); 
	18000 + 40: write_data(8'h89, data_out, data_command); 
	18000 + 41: write_data(8'h4B, data_out, data_command); 
	18000 + 42: write_data(8'h0A, data_out, data_command); 
	18000 + 43: write_data(8'h0C, data_out, data_command); 
	18000 + 44: write_data(8'h0E, data_out, data_command); 
	18000 + 45: write_data(8'h18, data_out, data_command); 
	18000 + 46: write_data(8'h1B, data_out, data_command); 
	18000 + 47: write_data(8'h0F, data_out, data_command); 
	18000 + 48: write_com(8'hE1, data_out, data_command);    
	18000 + 49: write_data(8'h00, data_out, data_command);  
	18000 + 50: write_data(8'h17, data_out, data_command); 
	18000 + 51: write_data(8'h1A, data_out, data_command); 
	18000 + 52: write_data(8'h04, data_out, data_command); 
	18000 + 53: write_data(8'h0E, data_out, data_command); 
	18000 + 54: write_data(8'h06, data_out, data_command); 
	18000 + 55: write_data(8'h2F, data_out, data_command); 
	18000 + 56: write_data(8'h45, data_out, data_command); 
	18000 + 57: write_data(8'h43, data_out, data_command); 
	18000 + 58: write_data(8'h02, data_out, data_command); 
	18000 + 59: write_data(8'h0A, data_out, data_command); 
	18000 + 60: write_data(8'h09, data_out, data_command); 
	18000 + 61: write_data(8'h32, data_out, data_command); 
	18000 + 62: write_data(8'h36, data_out, data_command); 
	18000 + 63: write_data(8'h0F, data_out, data_command); 
	18000 + 64: write_com(8'h11, data_out, data_command);
	78000 + 65: write_com(8'h29, data_out, data_command);
	78000 + 100: disp_cs <= 1'b1;
	78000 + 200: init_done <= 1'b1;
 	endcase
 end
 
 always @* begin
 	if (counter - 1 >= 17999 && counter - 1 <= 18000 + 64) begin
 		send_data <= ~clk;
 	end
 	else if (counter - 1 == 78000 + 65) begin
 		send_data <= ~clk;
 	end
 	else begin
 		send_data <= 1'b0;
 	end
 end
 endmodule

