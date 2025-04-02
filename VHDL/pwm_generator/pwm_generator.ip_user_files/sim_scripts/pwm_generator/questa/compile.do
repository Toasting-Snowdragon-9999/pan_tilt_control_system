vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xlconstant_v1_1_9
vlib questa_lib/msim/xil_defaultlib

vmap xlconstant_v1_1_9 questa_lib/msim/xlconstant_v1_1_9
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xlconstant_v1_1_9 -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_0/sim/pwm_generator_xlconstant_0_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_duty_cycle_lut_0_1/sim/pwm_generator_duty_cycle_lut_0_1.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_reset_comparator_0_2/sim/pwm_generator_reset_comparator_0_2.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_not_gate_0_1/sim/pwm_generator_not_gate_0_1.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_not_gate_1_0/sim/pwm_generator_not_gate_1_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_3_0/sim/pwm_generator_counter_3_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_fpga_2input_copier_0_0/sim/pwm_generator_fpga_2input_copier_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_1/sim/pwm_generator_xlconstant_0_1.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_2_1/sim/pwm_generator_counter_2_1.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_2/sim/pwm_generator_xlconstant_0_2.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_reset_comparator_0_3/sim/pwm_generator_reset_comparator_0_3.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_comparator_2_0/sim/pwm_generator_comparator_2_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_comparator_1_0/sim/pwm_generator_comparator_1_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_small_duty_cycle_lut_0_0/sim/pwm_generator_small_duty_cycle_lut_0_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/sim/pwm_generator.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

