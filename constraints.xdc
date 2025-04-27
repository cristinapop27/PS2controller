# Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK100MHZ]							
set_property IOSTANDARD LVCMOS33 [get_ports CLK100MHZ]

# Seven-segment display
set_property PACKAGE_PIN W7 [get_ports {CATOD[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CATOD[6]}]
set_property PACKAGE_PIN W6 [get_ports {CATOD[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CATOD[5]}]
set_property PACKAGE_PIN U8 [get_ports {CATOD[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CATOD[4]}]
set_property PACKAGE_PIN V8 [get_ports {CATOD[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CATOD[3]}]
set_property PACKAGE_PIN U5 [get_ports {CATOD[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CATOD[2]}]
set_property PACKAGE_PIN V5 [get_ports {CATOD[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CATOD[1]}]
set_property PACKAGE_PIN U7 [get_ports {CATOD[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CATOD[0]}]

# Anode pins for seven-segment display
set_property PACKAGE_PIN U2 [get_ports {ANOD[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANOD[3]}]
set_property PACKAGE_PIN U4 [get_ports {ANOD[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANOD[2]}]
set_property PACKAGE_PIN V4 [get_ports {ANOD[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANOD[1]}]
set_property PACKAGE_PIN W4 [get_ports {ANOD[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ANOD[0]}]

# PS/2 keyboard
set_property PACKAGE_PIN C17 [get_ports PS2_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_CLK]
set_property PULLUP true [get_ports PS2_CLK]
set_property PACKAGE_PIN B17 [get_ports PS2_DATA]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_DATA]
set_property PULLUP true [get_ports PS2_DATA]
