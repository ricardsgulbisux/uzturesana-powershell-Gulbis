$services = Gsv | Where {$_.Status -eq 'Stopped' -and $_.StartType -eq 'Automatic'}

if (-not $services) {
    'Parāditie servisi: 0'
} else {
    $services | Select Name, Status, StartType
}
