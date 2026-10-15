Get-Process |
    Sort-Object -Property WorkingSet64 |
    Select-Object -Last 10 |
    Select-Object -Property ProcessName, Id,
        @{Name="Atmina_MB"; Expression={[math]::Round($_.WorkingSet64 / 1MB, 1)}} |
    Format-Table -AutoSize