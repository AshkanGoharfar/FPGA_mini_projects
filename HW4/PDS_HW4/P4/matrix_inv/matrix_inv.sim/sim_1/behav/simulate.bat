@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim matrix_tb_behav -key {Behavioral:sim_1:Functional:matrix_tb} -tclbatch matrix_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
