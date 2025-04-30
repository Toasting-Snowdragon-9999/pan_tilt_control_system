transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+even_parity_checker  -L xil_defaultlib -L xlslice_v1_0_4 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.even_parity_checker xil_defaultlib.glbl

do {even_parity_checker.udo}

run 1000ns

endsim

quit -force
