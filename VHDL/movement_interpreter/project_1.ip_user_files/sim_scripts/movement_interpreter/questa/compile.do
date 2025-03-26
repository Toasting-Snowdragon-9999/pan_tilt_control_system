vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xlconstant_v1_1_9

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_9 questa_lib/msim/xlconstant_v1_1_9

vcom -work xil_defaultlib -64 -93  \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/ip/movement_interpreter_mode_selector_0_0/sim/movement_interpreter_mode_selector_0_0.vhd" \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/ip/movement_interpreter_comparator_equals_0_0/sim/movement_interpreter_comparator_equals_0_0.vhd" \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/ip/movement_interpreter_conditional_transmit_0_0/sim/movement_interpreter_conditional_transmit_0_0.vhd" \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/sim/movement_interpreter.vhd" \

vlog -work xlconstant_v1_1_9 -64 -incr -mfcu  \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/ip/movement_interpreter_xlconstant_0_0/sim/movement_interpreter_xlconstant_0_0.v" \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/ip/movement_interpreter_xlconstant_0_1/sim/movement_interpreter_xlconstant_0_1.v" \
"../../../../project_1.gen/sources_1/bd/movement_interpreter/ip/movement_interpreter_xlconstant_0_2/sim/movement_interpreter_xlconstant_0_2.v" \

vlog -work xil_defaultlib \
"glbl.v"

