 module test_SPI_Serialiser;

 reg _clk_in, _send_data;
 reg [7:0] _data_in;
 wire _data_out, _clk_out, _n_chip_enable;
  
 SPI_Serialiser SPI_Serialiser_inst(_clk_in, _send_data, _data_in, _data_out, _clk_out, _n_chip_enable);
 
 always
  #10 _clk_in = ~_clk_in;

initial
begin
  _clk_in = 0;
  _data_in = 8'b01110110;
  _send_data = 0;
  
  #10 _send_data = 1;
  #10 _send_data = 0;
  #140;
  _data_in = 8'b10011101;
  #10 _send_data = 1;
  #10 _send_data = 0;
  #180;
  _data_in = 8'b10010101;
  #10 _send_data = 1;
  #250 _send_data = 0;
  _data_in = 8'b11011101;
  #30 _send_data = 1;
  #10 _send_data = 0;
end

initial
begin
  #1000 $finish;
end

initial
begin
  $dumpfile("test_SPI_Serialiser_out.vcd");
  $dumpvars(0,test_SPI_Serialiser);
end

initial
$monitor($stime,, _clk_in, _send_data, _data_in, _data_out, _clk_out, _n_chip_enable);

endmodule
