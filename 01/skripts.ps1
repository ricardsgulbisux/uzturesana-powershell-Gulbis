$Sistema = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Output "Datora nosaukums: $env:COMPUTERNAME"
Write-Output "Operetājsistēma: $((Get-ComputerInfo).OsName)"
Write-Output "Būvejuma numurs: $((Get-ComputerInfo).WindowsBuildLabEx)"
Write-Output "PowerShell versija: $($PSVersionTable.PSVersion)"
Write-Output "Pašreizējais datums un laiks: $(Get-Date)"
Write-Output "Procesu skaits: $((Get-Process).Count)"