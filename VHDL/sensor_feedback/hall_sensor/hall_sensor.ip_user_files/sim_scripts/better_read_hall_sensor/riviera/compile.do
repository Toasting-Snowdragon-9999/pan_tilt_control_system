transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93  -incr \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_advanced_compare_0_0/sim/better_read_hall_sensor_advanced_compare_0_0.vhd" \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_advanced_counter_0_0/sim/better_read_hall_sensor_advanced_counter_0_0.vhd" \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_generate_clock_0_0/sim/better_read_hall_sensor_generate_clock_0_0.vhd" \
"../../../bd/better_read_hall_sensor/sim/better_read_hall_sensor.vhd" \


