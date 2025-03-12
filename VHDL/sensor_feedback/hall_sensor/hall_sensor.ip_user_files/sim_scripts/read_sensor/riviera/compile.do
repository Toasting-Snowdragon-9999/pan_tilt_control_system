transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93  -incr \
"../../../bd/read_sensor/ip/read_sensor_advanced_compare_0_0/sim/read_sensor_advanced_compare_0_0.vhd" \
"../../../bd/read_sensor/sim/read_sensor.vhd" \


