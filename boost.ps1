# Riduci il ritardo delle animazioni
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](0,0,0,0,0,0,0,0,22,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0))

# Disabilita le applicazioni in background
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 1

# Disabilita il servizio Windows Update
Set-Service -Name "wuauserv" -StartupType Disabled

# Riduci il ritardo del menu di avvio
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value 0

# Disabilita la condivisione automatica di file e stampanti
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "AutoShareWks" -Value 0

# Riduci il ritardo dell'avvio delle applicazioni in esecuzione automatica
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" -Name "StartupDelayInMSec" -Value 0

# Riduci la latenza del WiFi
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1

# Imposta la modalità gaming
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "UsePlatformHighGraphics" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AllowAutoGameMode" -Value 0

# Pulizia dei file temporanei e del prefetch
Remove-Item -Path "$env:TEMP\*" -Force -Recurse
Remove-Item -Path "$env:SystemRoot\Prefetch\*" -Force -Recurse

Write-Host "Boost delle prestazioni completato."

# Creazione di un file BAT per eseguire la pulizia dei file temporanei
$batCode = @"
echo off
echo Esecuzione della pulizia dei file temporanei...
del /q "%TEMP%\*.*" >nul 2>&1
echo Pulizia completata.
pause
"@

$batCode | Out-File -FilePath "pulizia_temp.bat" -Encoding ASCII

Write-Host "File BAT 'pulizia_temp.bat' creato."

# Creazione di un file CMD per eseguire la pulizia del prefetch
$cmdCode = @"
@echo off
echo Esecuzione della pulizia del prefetch...
del /q "%SystemRoot%\Prefetch\*.*" >nul 2>&1
echo Pulizia completata.
pause
"@

$cmdCode | Out-File -FilePath "pulizia_prefetch.cmd" -Encoding ASCII

Write-Host "File CMD 'pulizia_prefetch.cmd' creato."
