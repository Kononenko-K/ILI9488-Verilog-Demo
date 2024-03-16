#!/bin/sh

rm_sim_files()
{
	rm -f spi_serialiser_sim
	rm -f lcd_init_sim
	rm -f lcd_color_fill_sim
	rm -f test_SPI_Serialiser_out.vcd
	rm -f test_LCD_init_out.vcd
	rm -f test_LCD_color_fill_out.vcd
}

rm_sim_files
iverilog -o spi_serialiser_sim SPI_Serialiser.v test_SPI_Serialiser.v
iverilog -o lcd_init_sim LCD_init.v test_LCD_init.v
iverilog -o lcd_color_fill_sim LCD_color_fill.v test_LCD_color_fill.v
vvp spi_serialiser_sim
vvp lcd_init_sim
vvp lcd_color_fill_sim
gtkwave test_SPI_Serialiser_out.vcd
gtkwave test_LCD_init_out.vcd
gtkwave test_LCD_color_fill_out.vcd
rm_sim_files
