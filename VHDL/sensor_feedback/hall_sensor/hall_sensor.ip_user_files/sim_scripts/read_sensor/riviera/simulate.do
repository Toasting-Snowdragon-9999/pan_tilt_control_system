transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+read_sensor  -L xil_defaultlib -L xlconstant_v1_1_9 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.read_sensor xil_defaultlib.glbl

do {read_sensor.udo}

run 1000ns

endsim

quit -force
