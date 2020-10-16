@echo off
set size=0
call :filesize "README.md"
echo file size is %size%
goto :eof

:: Set filesize of first argument in %size% variable, and return
:filesize
  set size=%~z1
  exit /b 0