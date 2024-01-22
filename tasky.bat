@echo off
set FILTER=PID ge 0
echo Tasky v1.0
echo By Mocha with ^<3
echo.
:LOOP
set /p FILTER=Filter (type help for params): 
cls
if /i "%FILTER%"=="help" (
	tasklist /?
) else (
	tasklist /fi "%FILTER%"
)
echo.
goto LOOP