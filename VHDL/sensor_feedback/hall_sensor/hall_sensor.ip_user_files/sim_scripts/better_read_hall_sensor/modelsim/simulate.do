onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.better_read_hall_sensor

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {better_read_hall_sensor.udo}

run 1000ns

quit -force
