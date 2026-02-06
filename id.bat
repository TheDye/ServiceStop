@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM --- MachineGuid ---
for /f "tokens=3" %%A in ('
  reg query "HKLM\SOFTWARE\Microsoft\Cryptography" /v "MachineGuid" ^| findstr /i "REG_SZ"
') do set "MachineGuid=%%A"

REM --- HWProfileGuid ---
for /f "tokens=3" %%A in ('
  reg query "HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware Profiles\0001" /v "HWProfileGuid" ^| findstr /i "REG_SZ"
') do set "HWProfileGuid=%%A"

echo MachineGuid - !MachineGuid!
echo HWProfileGuid - !HWProfileGuid!

endlocal
pause
