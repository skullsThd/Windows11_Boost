# Ottimizzazione delle prestazioni del PC

# Imposta la politica di esecuzione di PowerShell su "Unrestricted"
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Disabilita le animazioni del sistema
$DisableAnimations = @"
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
"MinAnimate"="0"
"@

$DisableAnimations | Out-File -FilePath "$env:TEMP\DisableAnimations.reg" -Encoding ASCII
reg import "$env:TEMP\DisableAnimations.reg"
Remove-Item "$env:TEMP\DisableAnimations.reg" -Force

# Ottimizza le impostazioni di energia
powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

# Pulisce la cache dei file temporanei
Remove-Item -Path "$env:TEMP\*" -Force -Recurse
Remove-Item -Path "$env:LocalAppData\Temp\*" -Force -Recurse
Remove-Item -Path "$env:WinDir\Temp\*" -Force -Recurse

# Pulisce la cache dei file di prefetch
Get-ChildItem -Path "$env:WinDir\Prefetch\*" -Force | Remove-Item -Force

# Esegui la deframmentazione del disco
defrag.exe C: -f

# Riavvia il sistema per applicare le modifiche
Restart-Computer -Force
