@echo off

set day=-1
echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "yestorday=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%yestorday:~0,4%"
set "MM=%yestorday:~4,2%"
set "DD=%yestorday:~6,2%"
set "yestorday=File_%yyyy%%mm%%dd%"
echo %yestorday%

set day=-3
echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "threeDaysAgos=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%threeDaysAgos:~0,4%"
set "MM=%threeDaysAgos:~4,2%"
set "DD=%threeDaysAgos:~6,2%"
set "threeDaysAgos=File_%yyyy%%mm%%dd%"
echo %threeDaysAgos%

pause