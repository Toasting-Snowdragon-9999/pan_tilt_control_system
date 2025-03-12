onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib read_sensor_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {read_sensor.udo}

run 1000ns

quit -force
