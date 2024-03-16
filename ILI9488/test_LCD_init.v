 module test_LCD_init;

reg _clk;
reg _start_init;
wire [7:0] _data_out;
wire _send_data, _data_command, _disp_reset, _init_done;
  
 LCD_init LCD_init_inst(_clk, _start_init, _data_out, _send_data, _data_command, _disp_reset, _disp_cs, _init_done);
 
 always
  #1 _clk = ~_clk;

initial
begin
  _clk = 0;
end

initial
begin
  #200000 $finish;
end

initial
begin
  $dumpfile("test_LCD_init_out.vcd");
  $dumpvars(0,test_LCD_init);
end

initial
$monitor($stime,, _clk, _start_init, _data_out, _send_data, _data_command, _disp_reset, _disp_cs, _init_done);

endmodule
