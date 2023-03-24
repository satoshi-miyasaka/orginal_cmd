@echo off

set now_path=%cd%

call C:\Users\miyac\cmd\sub\arg.bat %*
if DEFINED path_%cmds% call set cmds=%%path_%cmds%%%
if - equ %cmds% set cmds=%before_path%
if ~ equ %cmds% set cmds=%HOMEDRIVE%%HOMEPATH%
cd /d %cmds%
if errorlevel 0 set before_path=%now_path%

set opts=
set cmds=
set now_path=

exit /b 0

