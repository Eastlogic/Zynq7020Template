connect -url tcp:127.0.0.1:3121
source D:/ARCHIVE/Xilinx_Vivado_2018_2/Zynq7020Template/Zynq7020Template.sdk/ZYNQ_CORE_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {jtag_cable_name =~ "Platform Cable USB II 1362020792042e" && level==0} -index 1
fpga -file D:/ARCHIVE/Xilinx_Vivado_2018_2/Zynq7020Template/Zynq7020Template.sdk/ZYNQ_CORE_wrapper_hw_platform_0/ZYNQ_CORE_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 1362020792042e"} -index 0
loadhw -hw D:/ARCHIVE/Xilinx_Vivado_2018_2/Zynq7020Template/Zynq7020Template.sdk/ZYNQ_CORE_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 1362020792042e"} -index 0
stop
ps7_init
configparams force-mem-access 0
bpadd -addr &main
