@echo off
set FILTER=PID ge 0
echo Tasky v1.1
echo By Mocha with ^<3
echo www.github.com/mochawoof/tasky
echo.
:LOOP
set COMMAND=
set /p COMMAND=Command (type help for params): 
cls
set COMMAND_PREFIX=%COMMAND:~0,1%
set COMMAND_SUFFIX=%COMMAND:~2%
set ECHO_TASKLIST=1
if /i "%COMMAND%"=="help" (
	set ECHO_TASKLIST=0
	echo.
	echo Commands consist of a single letter command and the command body.
	echo Example: f PID ge 0
	echo In this case "f" is the command and "PID ge 0" is the body.
	echo.
	echo Available commands:
	echo q: Quits tasky.
	echo f: Filters the task list. Uses standard filtering syntax applying to the "tasklist" command.
	echo k: Kills the given task by name or PID.
	echo s: Starts the given executable path.
	echo.
	echo Shorthands:
	echo 0: Resets the task list filter.
	
) else if /i "%COMMAND_PREFIX%"=="q" (
	exit
) else if /i "%COMMAND_PREFIX%"=="f" (
	set FILTER=%COMMAND_SUFFIX%
) else if /i "%COMMAND_PREFIX%"=="k" (
	set ECHO_TASKLIST=0
	taskkill /f /im "%COMMAND_SUFFIX%"
) else if /i "%COMMAND_PREFIX%"=="s" (
	set ECHO_TASKLIST=0
	start "" "%COMMAND_SUFFIX%"

) else if /i "%COMMAND_PREFIX%"=="0" (
	set FILTER=PID ge 0
)

if "%ECHO_TASKLIST%"=="1" (
	tasklist /fi "%FILTER%"
)
echo.
goto LOOP