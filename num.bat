@echo off
set old_path_number=%path_number%
set path_number=0

call :old_clear %old_path_number%
set opts=
set cmds=
call C:\Users\miyac\cmd\sub\arg.bat %*
set search=*%cmds%*
for /f "delims=" %%i in ('dir /b%opts% %search%') do call :make_list "%%i"

call :path_display

set opts=
set cmds=
set search=

exit /b 0

:make_list
call set /a path_number=%path_number%+1
call set path_%path_number%=%1
exit /b 0

:old_clear
for /l %%i in (1, 1, %2) do set %1_%%i=

exit /b 0

:path_display
for /l %%i in (1, 1, %path_number%) do (call :path_echo %%i path_%%i)
exit /b 0

:path_echo
call :path_echo2 %1 %%%2%%
exit /b 0

:path_echo2
set size=%~z2
set tani=B
set pad=
if defined size (if 1024 lss %size% set /a size=%size%/1024&set tani=K)
if defined size (if 1024 lss %size% set /a size=%size%/1024&set tani=M)
if defined size (if 1024 lss %size% set /a size=%size%/1024&set tani=G)
if 1000 gtr %size% set pad=-
if 100  gtr %size% set pad=--
if 10   gtr %size% set pad=---

echo %~ta2 %pad:-= %%size%%tani% [%1] %~2 

set size=
set tani=
set pad=

exit /b 0
