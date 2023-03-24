::引数解析
set opts=
set cmds=

for %%i in (%*) do call :main %%i
if "" neq "%opts%" set opts=%opts:~1%
if "" neq "%cmds%" set cmds=%cmds:~1%

exit /b 0

:main
::set dq_flag=0
set arg=%1
set rep=%~1
::if %arg% neq %rep% set dq_flag=1

if - equ %rep% (set cmds=%cmds% %rep%&goto end)
if - equ %rep:~0,1% (set opts=%opts% /%rep:~1%&goto end)
if / equ %rep:~0,1% (set opts=%opts% %rep%&goto end)
set cmds=%cmds% %rep%

:end
set arg=
set rep=

exit /b 0
