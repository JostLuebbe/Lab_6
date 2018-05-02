## Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]
## Switches
set_property PACKAGE_PIN V17 [get_ports {init_val_one[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_one[0]}]
set_property PACKAGE_PIN V16 [get_ports {init_val_one[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_one[1]}]
set_property PACKAGE_PIN W16 [get_ports {init_val_one[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_one[2]}]
set_property PACKAGE_PIN W17 [get_ports {init_val_one[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_one[3]}]
set_property PACKAGE_PIN W15 [get_ports {init_val_two[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_two[0]}]
set_property PACKAGE_PIN V15 [get_ports {init_val_two[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_two[1]}]
set_property PACKAGE_PIN W14 [get_ports {init_val_two[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_two[2]}]
set_property PACKAGE_PIN W13 [get_ports {init_val_two[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {init_val_two[3]}]
set_property PACKAGE_PIN T1 [get_ports {mode_sel[0]}]	
	set_property IOSTANDARD LVCMOS33 [get_ports {mode_sel[0]}]
set_property PACKAGE_PIN R2 [get_ports {mode_sel[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {mode_sel[1]}]
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {a}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN W6 [get_ports {b}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property PACKAGE_PIN U8 [get_ports {c}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {c}]
set_property PACKAGE_PIN V8 [get_ports {d}]	
	set_property IOSTANDARD LVCMOS33 [get_ports {d}]
set_property PACKAGE_PIN U5 [get_ports {e}]
	set_property IOSTANDARD LVCMOS33 [get_ports {e}]
set_property PACKAGE_PIN V5 [get_ports {f}]
	set_property IOSTANDARD LVCMOS33 [get_ports {f}]
set_property PACKAGE_PIN U7 [get_ports {g}]
	set_property IOSTANDARD LVCMOS33 [get_ports {g}]

set_property PACKAGE_PIN V7 [get_ports dp]
	set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {enable_D1}]
	set_property IOSTANDARD LVCMOS33 [get_ports {enable_D1}]
set_property PACKAGE_PIN U4 [get_ports {enable_D2}]
	set_property IOSTANDARD LVCMOS33 [get_ports {enable_D2}]
set_property PACKAGE_PIN V4 [get_ports {enable_D3}]
	set_property IOSTANDARD LVCMOS33 [get_ports {enable_D3}]
set_property PACKAGE_PIN W4 [get_ports {enable_D4}]
	set_property IOSTANDARD LVCMOS33 [get_ports {enable_D4}]
##Buttons
set_property PACKAGE_PIN U18 [get_ports {toggle}]
	set_property IOSTANDARD LVCMOS33 [get_ports {toggle}]
set_property PACKAGE_PIN T18 [get_ports {reset}]
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]