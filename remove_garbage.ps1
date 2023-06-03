# Rimuovi la spazzatura dal PC
Remove-Item -Path "C:\Temp\*" -Recurse -Force
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force
