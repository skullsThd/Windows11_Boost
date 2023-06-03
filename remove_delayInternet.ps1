# Imposta le impostazioni TCP/IP per ridurre la latenza e il lag del Wi-Fi
Set-NetTCPSetting -SettingName "Internet" -CongestionProvider CTCP
Set-NetTCPSetting -SettingName "Internet" -InitialCongestionWindow 10
