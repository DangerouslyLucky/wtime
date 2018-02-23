@echo off
@setlocal

set s=%time%
cmd /c %*
set e=%time%
set opt="tokens=1-4 delims=:.,"
for /f %opt% %%a in ("%s%") do set s_h=%%a&set /a s_m=100%%b %% 100&set /a s_s=100%%c %% 100&set /a s_ms=100%%d %% 100
for /f %opt% %%a in ("%e%") do set e_h=%%a&set /a e_m=100%%b %% 100&set /a e_s=100%%c %% 100&set /a e_ms=100%%d %% 100
set /a hours=%e_h%-%s_h%
set /a mins=%e_m%-%s_m%
set /a secs=%e_s%-%s_s%
set /a ms=%e_ms%-%s_ms%
if %ms% lss 0 set /a secs = %secs% - 1 & set /a ms = 100%ms%
if %secs% lss 0 set /a mins = %mins% - 1 & set /a secs = 60%secs%
if %mins% lss 0 set /a hours = %hours% - 1 & set /a mins = 60%mins%
if %hours% lss 0 set /a hours = 24%hours%
if 1%ms% lss 100 set ms=0%ms%
set /a tsec = %hours%*3600 + %mins%*60 + %secs%

echo Runtime: %hours%:%mins%:%secs%.%ms% (%tsec%.%ms%s total)
