$t = (Get-Date).AddHours(-48)
$k = @(Get-WinEvent -FilterHashtable @{LogName="System"; Level=2; StartTime=$t} -ErrorAction SilentlyContinue)
Write-Output "Kļūdu skaits: $($k.Count)"
$k | Group-Object ProviderName | Sort-Object Count -Descending | Select-Object -First 1 Name, Count