onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+dist_mem_gen_0 -L xil_defaultlib -L secureip -O5 xil_defaultlib.dist_mem_gen_0

do {wave.do}

view wave
view structure

do {dist_mem_gen_0.udo}

run -all

endsim

quit -force
