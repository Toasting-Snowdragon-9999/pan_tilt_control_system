transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+read_sensor  -L xil_defaultlib -L secureip -O5 xil_defaultlib.read_sensor

do {read_sensor.udo}

run 1000ns

endsim

quit -force
