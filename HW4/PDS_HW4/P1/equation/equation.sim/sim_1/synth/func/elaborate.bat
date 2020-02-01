@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto c1118b5549914654b9c4b81a273dc306 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot top_tb_func_synth xil_defaultlib.top_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
