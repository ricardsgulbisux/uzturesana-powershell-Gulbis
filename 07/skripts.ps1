foreach ($d in Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3") {
    $b = [math]::Round($d.FreeSpace / 1GB, 2)
    Write-Output "$($d.DeviceID): brīvi $b GB"
    if ($b -lt 10) {Write-Output "BRĪDINĀJUMS: maz vietas!"}
}