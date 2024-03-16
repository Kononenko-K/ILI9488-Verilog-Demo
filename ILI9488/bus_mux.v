 module bus_mux (
 input wire init_done,
 input wire [7:0] data_in1,
 input wire [7:0] data_in2,
 input wire cs1,
 input wire cs2,
 input wire dc1,
 input wire dc2,
 input wire sd1,
 input wire sd2,
 output reg [7:0] data_out = 8'b0,
 output reg cs,
 output reg dc,
 output reg sd
 );
 
 always @* begin
	 if (!init_done) begin
		data_out <= data_in1;
		cs <= cs1;
		dc <= dc1;
		sd <= sd1;
	 end
	 else begin
		data_out <= data_in2;
		cs <= cs2;
		dc <= dc2;
		sd <= sd2;
	 end
 end
 
 endmodule