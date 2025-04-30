onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib even_parity_checker_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {even_parity_checker.udo}

run 1000ns

quit -force
