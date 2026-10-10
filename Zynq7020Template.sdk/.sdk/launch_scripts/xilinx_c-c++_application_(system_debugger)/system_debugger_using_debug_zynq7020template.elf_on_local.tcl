connect -url tcp:127.0.0.1:3121
source D:/ARCHIVE/Xilinx_Vivado_2018_2/Zynq7020Template/Zynq7020Template.sdk/ZYNQ_CORE_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 1362020792042e"} -index 0
loadhw -hw D:/ARCHIVE/Xilinx_Vivado_2018_2/Zynq7020Template/Zynq7020Template.sdk/ZYNQ_CORE_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 1362020792042e"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB II 1362020792042e"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Platform Cable USB II 1362020792042e"} -index 0
dow D:/ARCHIVE/Xilinx_Vivado_2018_2/Zynq7020Template/Zynq7020Template.sdk/Zynq7020Template/Debug/Zynq7020Template.elf
configparams force-mem-access 0
bpadd -addr &main
