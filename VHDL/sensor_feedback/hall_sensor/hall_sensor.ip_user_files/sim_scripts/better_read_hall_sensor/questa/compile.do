vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib  -93  \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_advanced_compare_0_0/sim/better_read_hall_sensor_advanced_compare_0_0.vhd" \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_advanced_counter_0_0/sim/better_read_hall_sensor_advanced_counter_0_0.vhd" \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_generate_clock_0_0/sim/better_read_hall_sensor_generate_clock_0_0.vhd" \
"../../../bd/better_read_hall_sensor/sim/better_read_hall_sensor.vhd" \


