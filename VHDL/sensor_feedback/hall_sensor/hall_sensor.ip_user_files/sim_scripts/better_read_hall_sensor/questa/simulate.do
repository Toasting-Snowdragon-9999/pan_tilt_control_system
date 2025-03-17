onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib better_read_hall_sensor_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {better_read_hall_sensor.udo}

run 1000ns

quit -force
