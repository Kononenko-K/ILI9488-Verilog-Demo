# ILI9488-Verilog-Demo
A simple pure Verilog ILI9488 320x480 TFT Display demo
<br/>
<p align="center">
     <img src="https://github.com/Kononenko-K/ILI9488-Verilog-Demo/blob/main/pics/demo.gif">
</p>

## Overview
<p align="center">
    <img src="https://github.com/Kononenko-K/ILI9488-Verilog-Demo/blob/main/pics/schematic.png">
</p>

This project is a simple demo written in pure Verilog that demonstrates basic color fill on a popular 320x480 ILI9488 display. It works through SPI in 18-bit color mode. A repo contains Quartus project for RZ-EasyFPGA development board based on EP4CE6E22C8N Cyclone IV FPGA. The project doesn't contain platform-specific HDL code. A top-level entity is a .bdf file, but autogenerated [ILI9488.v](/ILI9488/ILI9488.v) can be used as well. Some test benches can be run with [run_sim.sh](/ILI9488/run_sim.sh) (Icarus Verilog required)

Display connection guide:

|display module      |fpga board |
|--------------------|-----------|
|Reset               |PIN_31     |
|MOSI                |PIN_30     |
|CLK                 |PIN_28     |
|D/C                 |PIN_33     |
|CS                  |PIN_38     |