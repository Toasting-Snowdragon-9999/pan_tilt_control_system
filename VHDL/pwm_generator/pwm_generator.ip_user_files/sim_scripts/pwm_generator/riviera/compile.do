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
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ipshared/3d05/src/counter.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_0_0/sim/pwm_generator_counter_0_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ipshared/c825/src/comparator.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_comparator_0_0/sim/pwm_generator_comparator_0_0.vhd" \

vlog -work xlconstant_v1_1_9  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_0/sim/pwm_generator_xlconstant_0_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_comparator_0_2/sim/pwm_generator_comparator_0_2.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_0_2/sim/pwm_generator_counter_0_2.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_enabled_0_1/sim/pwm_generator_enabled_0_1.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_duty_cycle_lut_0_0/sim/pwm_generator_duty_cycle_lut_0_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_duty_cycle_lut_0_1/sim/pwm_generator_duty_cycle_lut_0_1.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/sim/pwm_generator.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_equal_comparator_0_0/sim/pwm_generator_equal_comparator_0_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_reset_comparator_0_2/sim/pwm_generator_reset_comparator_0_2.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_not_gate_0_1/sim/pwm_generator_not_gate_0_1.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_not_gate_1_0/sim/pwm_generator_not_gate_1_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

