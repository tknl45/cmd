set day=-1
echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "yestorday=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%yestorday:~0,4%"
set "MM=%yestorday:~4,2%"
set "DD=%yestorday:~6,2%"
set "yestorday=CPISCSAPP01_CLDM_%yyyy%%mm%%dd%"
echo %yestorday%

SET CurrentDir=%~dp0
echo %CurrentDir%

set size=0
call :filesize %CurrentDir%output\%yestorday%.txt
echo file size is %size%

IF "%size%"=="" (GOTO exeCmd) ELSE (echo SizeOK)

::if %size% == "" %CurrentDir%date.cmd
::echo "SizeOK"
pause
goto :eof

:: Set filesize of first argument in %size% variable, and return
:filesize
  set size=%~z1
  exit /b 0

:exeCmd
  %CurrentDir%date.cmd
  exit /b 0
