$procesi = Get-Process
$servisi = Get-Service
$darbojas = 0
$aptureti = 0

foreach ($s in $servisi) {
    if ($s.Status -eq "Running") {
        $darbojas++
    }
    elseif ($s.Status -eq "Stopped") {
        $aptureti++
    }
}

$sakums = (Get-Date).AddHours(-48)
$kludas = @(Get-WinEvent -FilterHashtable @{
    LogName = "System"
    Level = 2
    StartTime = $sakums
} -ErrorAction SilentlyContinue)

Write-Output "Procesu skaits: $($procesi.Count)"
Write-Output "Darbojas servisi: $darbojas"
Write-Output "Apturēti servisi: $aptureti"
Write-Output "Kļūdas pēdējās 48 stundās: $($kludas.Count)"

Get-CimInstance -ClassName Win32_LogicalDisk |
    Where-Object { $_.DriveType -eq 3 } |
    ForEach-Object {
        Write-Output "$($_.DeviceID) brīvā vieta GB: $([math]::Round($_.FreeSpace / 1GB, 2))"
    }
