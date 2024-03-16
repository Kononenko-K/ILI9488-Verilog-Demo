 module clock_divider (
	input wire clk_in,
	output reg out1,
	output reg out2
 );
  //assuming clk_in=50MHz
  parameter DIV1 = 10;//5MHz
  parameter DIV2 = 250;//200kHz
  reg [31:0] counter1 = 32'b0;
  reg [31:0] counter2 = 32'b0;
  
  always @ (posedge clk_in)
  begin
	 counter1 <= counter1 + 32'b1;
	 counter2 <= counter2 + 32'b1;
	 if (counter1 >= (DIV1 - 1)) begin
		counter1 <= 32'b0;
	 end
	 
	 if (counter2 >= (DIV2 - 1)) begin
		counter2 <= 32'b0;
	 end
	 
	 if (counter1 < DIV1/2) begin
		out1 <= 1'b1;
	 end
	 else begin
		out1 <= 1'b0;
	 end
	 
	 if (counter2 < DIV2/2) begin
		out2 <= 1'b1;
	 end
	 else begin
		out2 <= 1'b0;
	 end
	 
  end
 
 endmodule