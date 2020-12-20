REM this script helps to recursively block the internet connections for all the exe & dll files


@ setlocal enableextensions
@ cd /d "%~dp0"

for /R %%f in (*.dll) do (
    netsh advfirewall firewall add rule name="Blocked: %%f" dir=in program="%%f" action=block
    netsh advfirewall firewall add rule name="Blocked: %%f" dir=out program="%%f" action=block
)


for /R %%f in (*.exe) do (
    netsh advfirewall firewall add rule name="Blocked: %%f" dir=in program="%%f" action=block
    netsh advfirewall firewall add rule name="Blocked: %%f" dir=out program="%%f" action=block
)