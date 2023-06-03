# Ottimizza i frame rate a 120 con delay 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\XAML\Perf" -Name "DisableDisplayMaximumDelay" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\XAML\Perf" -Name "MaximumSwapChainBuffers" -Value 2
