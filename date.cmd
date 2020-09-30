@echo off

echo %date%
echo %time%

For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b:%%c)
echo %mydate%
echo %mytime%


pause