vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93  \
"../../../bd/read_sensor/ip/read_sensor_advanced_compare_0_0/sim/read_sensor_advanced_compare_0_0.vhd" \
"../../../bd/read_sensor/sim/read_sensor.vhd" \


