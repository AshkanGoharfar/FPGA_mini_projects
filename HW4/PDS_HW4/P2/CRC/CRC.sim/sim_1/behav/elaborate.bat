@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 4af44076c9c04829a42342e908e9b662 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot CRC_tb_behav xil_defaultlib.CRC_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
