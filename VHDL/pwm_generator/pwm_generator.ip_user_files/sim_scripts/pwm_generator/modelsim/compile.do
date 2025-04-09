vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xlconstant_v1_1_9
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconcat_v2_1_6

vmap xlconstant_v1_1_9 modelsim_lib/msim/xlconstant_v1_1_9
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconcat_v2_1_6 modelsim_lib/msim/xlconcat_v2_1_6

vlog -work xlconstant_v1_1_9 -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_0/sim/pwm_generator_xlconstant_0_0.v" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_1/sim/pwm_generator_xlconstant_0_1.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_2_1/sim/pwm_generator_counter_2_1.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_2/sim/pwm_generator_xlconstant_0_2.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_reset_comparator_0_3/sim/pwm_generator_reset_comparator_0_3.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_big_duty_cycle_lut_0_0/sim/pwm_generator_big_duty_cycle_lut_0_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_comparator_1_1/sim/pwm_generator_comparator_1_1.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/sim/pwm_generator.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_big_duty_cycle_lut_0_1/sim/pwm_generator_big_duty_cycle_lut_0_1.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_clear_comparator_1_0/sim/pwm_generator_clear_comparator_1_0.vhd" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_comparator_3_0/sim/pwm_generator_comparator_3_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_disabled_0_0/sim/pwm_generator_disabled_0_0.v" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_enabled_0_0/sim/pwm_generator_enabled_0_0.v" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_twentyone_constant_0_0/sim/pwm_generator_twentyone_constant_0_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_twentyone_counter_0_0/sim/pwm_generator_twentyone_counter_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_3/sim/pwm_generator_xlconstant_0_3.v" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_4/sim/pwm_generator_xlconstant_0_4.v" \

vlog -work xlconcat_v2_1_6 -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ipshared/6120/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconcat_0_0/sim/pwm_generator_xlconcat_0_0.v" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconcat_0_1/sim/pwm_generator_xlconcat_0_1.v" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_0_5/sim/pwm_generator_xlconstant_0_5.v" \
"../../../../pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_xlconstant_1_0/sim/pwm_generator_xlconstant_1_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

