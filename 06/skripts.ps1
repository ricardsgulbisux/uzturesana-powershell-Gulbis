$draiveri = @(Get-CimInstance -ClassName Win32_PnPSignedDriver |
    Where-Object {
        $_.DriverProviderName -and
        $_.DriverProviderName -ne "Microsoft"
    })

$draiveri | Select-Object DeviceName, DriverProviderName, DriverVersion |
    Export-Csv -Path ".\draiveri.csv" -NoTypeInformation -Encoding UTF8

Write-Output "CSV datu rindu skaits: $($draiveri.Count)"
Write-Output "Fails saglabāts: draiveri.csv"
