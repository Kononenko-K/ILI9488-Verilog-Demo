task automatic write_com (input [7:0] in_val, output [7:0] __data_out, output __data_command);
	begin
		__data_command = 1'b0;
		__data_out = in_val;
	end
endtask

task automatic write_data (input [7:0] in_val, output [7:0] __data_out, output __data_command);
	begin
		__data_command = 1'b1;
		__data_out = in_val;
	end
endtask
