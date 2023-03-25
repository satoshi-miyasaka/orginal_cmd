::echo off
call %USERPROFILE%\set_env.bat

set cp_from=%1
if defined %1 call set cp_from=%%%1%%
if defined path_%1 call set cp_from=%%path_%1%%

set cp_to=%2
if defined %2 call set cp_to=%%%2%%
if defined path_%2 call set cp_to=%%path_%2%%

if not exist %cp_from% (
	echo コピー元ないのはちょっと。。。
	exit /b 1
)

copy %cp_from% %cp_to%

exit /b 0

