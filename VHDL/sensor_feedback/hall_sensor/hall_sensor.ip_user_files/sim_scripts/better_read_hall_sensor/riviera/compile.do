transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib
vlib riviera/xlconstant_v1_1_9

vmap xil_defaultlib riviera/xil_defaultlib
vmap xlconstant_v1_1_9 riviera/xlconstant_v1_1_9

vcom -work xil_defaultlib -93  -incr \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_advanced_compare_0_0/sim/better_read_hall_sensor_advanced_compare_0_0.vhd" \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_advanced_counter_0_0/sim/better_read_hall_sensor_advanced_counter_0_0.vhd" \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_comparator_equal_0_0/sim/better_read_hall_sensor_comparator_equal_0_0.vhd" \

vlog -work xlconstant_v1_1_9  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../../hall_sensor.gen/sources_1/bd/better_read_hall_sensor/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_xlconstant_0_1/sim/better_read_hall_sensor_xlconstant_0_1.v" \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_xlconstant_0_2/sim/better_read_hall_sensor_xlconstant_0_2.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/better_read_hall_sensor/ip/better_read_hall_sensor_generate_clock_0_0/sim/better_read_hall_sensor_generate_clock_0_0.vhd" \
"../../../bd/better_read_hall_sensor/sim/better_read_hall_sensor.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

