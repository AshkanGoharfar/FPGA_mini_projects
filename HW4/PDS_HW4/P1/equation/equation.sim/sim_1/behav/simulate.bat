@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim top_tb_file_behav -key {Behavioral:sim_1:Functional:top_tb_file} -tclbatch top_tb_file.tcl -view D:/Ashkan works/PDS_HW4/P1/equation/top_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
