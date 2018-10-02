@echo off
set xv_path=E:\\Vivado\\install\\Vivado\\2016.4\\bin
call %xv_path%/xsim Keyboard_Driver_tb_time_synth -key {Post-Synthesis:sim_1:Timing:Keyboard_Driver_tb} -tclbatch Keyboard_Driver_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
