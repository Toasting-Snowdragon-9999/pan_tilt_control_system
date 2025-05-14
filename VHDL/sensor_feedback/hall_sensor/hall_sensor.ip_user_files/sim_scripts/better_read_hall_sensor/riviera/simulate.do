transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+better_read_hall_sensor  -L xil_defaultlib -L secureip -O5 xil_defaultlib.better_read_hall_sensor

do {better_read_hall_sensor.udo}

run 1000ns

endsim

quit -force
