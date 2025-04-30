vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlslice_v1_0_4

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlslice_v1_0_4 modelsim_lib/msim/xlslice_v1_0_4

vcom -work xil_defaultlib -64 -93  \
"../../../bd/even_parity_checker/ipshared/804a/src/xor_gate.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_0_0/sim/even_parity_checker_xor_gate_0_0.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_0_1/sim/even_parity_checker_xor_gate_0_1.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_0_2/sim/even_parity_checker_xor_gate_0_2.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_0_3/sim/even_parity_checker_xor_gate_0_3.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_0_4/sim/even_parity_checker_xor_gate_0_4.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_0_5/sim/even_parity_checker_xor_gate_0_5.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_0_6/sim/even_parity_checker_xor_gate_0_6.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_pass_fail_0_0/sim/even_parity_checker_pass_fail_0_0.vhd" \
"../../../bd/even_parity_checker/ipshared/1ccc/src/not_gate.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_not_gate_0_0/sim/even_parity_checker_not_gate_0_0.vhd" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xor_gate_8_0/sim/even_parity_checker_xor_gate_8_0.vhd" \

vlog -work xlslice_v1_0_4 -64 -incr -mfcu  \
"../../../../translator.gen/sources_1/bd/even_parity_checker/ipshared/a97c/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../bd/even_parity_checker/ip/even_parity_checker_xlslice_0_0/sim/even_parity_checker_xlslice_0_0.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_0_0/sim/even_parity_checker_bit_0_0.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_1_0/sim/even_parity_checker_bit_1_0.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_2_0/sim/even_parity_checker_bit_2_0.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_2_1/sim/even_parity_checker_bit_2_1.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_2_2/sim/even_parity_checker_bit_2_2.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_2_3/sim/even_parity_checker_bit_2_3.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_2_4/sim/even_parity_checker_bit_2_4.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_bit_2_5/sim/even_parity_checker_bit_2_5.v" \
"../../../bd/even_parity_checker/ip/even_parity_checker_xlslice_0_2/sim/even_parity_checker_xlslice_0_2.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/even_parity_checker/sim/even_parity_checker.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

