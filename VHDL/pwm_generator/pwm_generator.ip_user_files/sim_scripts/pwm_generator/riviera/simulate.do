transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+pwm_generator  -L xil_defaultlib -L xlconstant_v1_1_9 -L xlconcat_v2_1_6 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.pwm_generator xil_defaultlib.glbl

do {pwm_generator.udo}

run 1000ns

endsim

quit -force
