 module test_LCD_color_fill;

reg _clk;
reg _init_done;
reg [15:0] _input_color;
wire [7:0] _data_out;
wire _send_data, _data_command, _disp_cs, _fill_done, _reset_done;
  
 LCD_color_fill LCD_color_fill_inst(_clk, _init_done, _reset_states, _input_color, _data_out, _send_data, _data_command, _disp_cs, _fill_done, _reset_done);
 
 always
  #1 _clk = ~_clk;

initial
begin
  _init_done = 0;
  _input_color = 16'hf800;
  _clk = 0;
  #50 _init_done = 1;
end

initial
begin
  #1500000 $finish;
end

initial
begin
  $dumpfile("test_LCD_color_fill_out.vcd");
  $dumpvars(0,test_LCD_color_fill);
end

initial
$monitor($stime,, _clk, _init_done, _reset_states, _input_color, _data_out, _send_data, _data_command, _disp_cs, _fill_done, _reset_done);

endmodule
