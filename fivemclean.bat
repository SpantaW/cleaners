@echo off
:: Check for administrator privileges

:: Blocks Xbox
echo 127.0.0.1 xboxlive.com >> "%WINDIR%\System32\drivers\etc\hosts"
echo 127.0.0.1 user.auth.xboxlive.com >> "%WINDIR%\System32\drivers\etc\hosts"
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> "%WINDIR%\System32\drivers\etc\hosts"

:: Deletes specified files and directories
for %%i in (
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\discord.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX_SubProcess_chrome.bin"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX_SubProcess_game.bin"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX_SubProcess_game_372.bin"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX_SubProcess_game_1604.bin"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX_SubProcess_game_1868.bin"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX_SubProcess_game_2060.bin"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX_SubProcess_game_2189.bin"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\botan.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\asi-five.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\steam.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\steam_api64.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenGame.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\profiles.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\cfx_curl_x86_64.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\CitizenFX.ini"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\caches.XML"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\adhesive.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\cfx_curl_x86_64.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\steam_api64.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\profiles.dll"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\logs"
    "%USERPROFILE%\AppData\Local\FiveM\FiveM.app\crashes"
) do (
    if exist "%%i" del /s /q "%%i"
)
powershell -Command "& {Get-AppxPackage -AllUsers xbox | Remove-AppxPackage}" >NUL 2>NUL
sc stop XblAuthManager >NUL 2>NUL
sc stop XblGameSave >NUL 2>NUL
sc stop XboxNetApiSvc >NUL 2>NUL
sc stop XboxGipSvc >NUL 2>NUL
sc delete XblAuthManager >NUL 2>NUL
sc delete XblGameSave >NUL 2>NUL
sc delete XboxNetApiSvc >NUL 2>NUL
sc delete XboxGipSvc >NUL 2>NUL
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /f >NUL 2>NUL
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /disable >NUL 2>NUL
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable >NUL 2>NUL
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >NUL 2>NUL
del /s /f /q "%appdata%\CitizenFX" >nul 2>nul 
del /s /f /q "%appdata%\DigitalEntitlements" >nul 2>nul
del /s /f /q "%appdata%\Discord\%discordVersion%\modules\discord_rpc" >nul 2>nul
rmdir /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\cache" >nul
rmdir /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache" >nul
rmdir /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\server-cache-priv" >nul
rmdir /s /q "%LOCALAPPDATA%\FiveM\FiveM.app\data\nui-storage" >nul
rmdir /s /q "%LOCALAPPDATA%\DigitalEntitlements" >nul
rmdir /s /q "%LOCALAPPDATA%\D3DSCache" >nul
rmdir /s /q "%APPDATA%\CitizenFX" >nul
rmdir /s /q "%USERNAME%\Saved Games\CitizenFX" >nul
del /s /q /f "%LOCALAPPDATA%\FiveM\FiveM.app\asi-five.dll" >nul
del /s /q /f "%LOCALAPPDATA%\FiveM\FiveM.app\CitizenFX.ini" >nul
del /s /q /f "%LOCALAPPDATA%\FiveM\FiveM.app\cfx_curl_x86_64.dll" >nul
del /s /q /f "%LOCALAPPDATA%\FiveM\FiveM.app\steam_api64.dll" >nul
del /s /q /f "%LOCALAPPDATA%\FiveM\FiveM.app\steam.dll" >nul
del /s /q /f "%LOCALAPPDATA%\FiveM\FiveM.app\logs\*.*" >nul
del /s /q /f "%LOCALAPPDATA%\FiveM\FiveM.app\crashes\*.*" >nul
echo fivm shit successfully cleaned
exit