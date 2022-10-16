#============================================================================
#
#
#	Bing
#
#
#----------------------------------------------------------------------------
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]


#=========================== Sys Clock & rstn ================================
## Clock Signal     50M
set_property -dict { PACKAGE_PIN R4    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #R4
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports clk]

## mcu Rst_n
set_property -dict { PACKAGE_PIN U2  IOSTANDARD LVCMOS33 } [get_ports { mcu_rst }]; #PL_KEY1   U2
#----------------------------------------------------------------------------




#=========================== Debug JTAG ======================================

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IOBUF_jtag_TCK/O]

# mcu_TCK
# mcu_TDO
# mcu_TMS
# rst
# mcu_TDI
# JTAG Debug Port
set_property -dict { PACKAGE_PIN K22  IOSTANDARD LVCMOS33 } [get_ports { mcu_TCK }]; #K22
set_property -dict { PACKAGE_PIN J22  IOSTANDARD LVCMOS33 } [get_ports { mcu_TDO }]; #J22
set_property -dict { PACKAGE_PIN G22  IOSTANDARD LVCMOS33 } [get_ports { mcu_TMS }]; #G22
set_property -dict { PACKAGE_PIN E19  IOSTANDARD LVCMOS33 } [get_ports { mcu_TDI }]; #E19


#------------------------ End of Debug JTAG ----------------------------------





#=============================== UART 0 ======================================

set_property -dict { PACKAGE_PIN V9   IOSTANDARD LVCMOS33 } [get_ports { uart0_tx }]; #V9
set_property -dict { PACKAGE_PIN Y9   IOSTANDARD LVCMOS33 } [get_ports { uart0_rx }]; #Y9

#---------------------------- End of UART 0 --------------------------------


#LED1       ---> T12
#LED2       ---> U12
#LED3       ---> V12
#LED4       ---> W13
#PL_KEY1    ---> M20
#PL_KEY2    ---> M19



## GPIOA
#LEDs
set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports { gpioA_0 }]; # T12
set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS33 } [get_ports { gpioA_1 }]; # U12
set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS33 } [get_ports { gpioA_2 }]; # V12
set_property -dict { PACKAGE_PIN Y2   IOSTANDARD LVCMOS33 } [get_ports { gpioA_3 }]; # W13

#KEY
set_property -dict { PACKAGE_PIN T1   IOSTANDARD LVCMOS33 } [get_ports { gpioA_4 }]; # M19

# 40P
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports { gpioA_5 }]; # P18
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports { gpioA_6 }]; # P19
set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports { gpioA_7 }]; # R18


## OLED Display
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { gpioA_20 }]; #OLED_DC          Y14
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { gpioA_21 }]; #OLED_RES         V16
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { gpioA_22 }]; #OLED_CLK   D0    U18
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { gpioA_23 }]; #OLED_SDIN  D1    T17
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { gpioA_24 }]; #VBAT             R17
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { gpioA_25 }]; #VDD              W20







