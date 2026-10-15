$servisi = Get-Service
$darbojas = 0
$aptureti = 0

foreach ($serviss in $servisi) {
    if ($serviss.Status -eq "Running") {
        $darbojas++
    }
    elseif ($serviss.Status -eq "Stopped") {
        $aptureti++
    }
}

Write-Output "Darbojas: $darbojas"
Write-Output "Apturēti: $aptureti"
Write-Output "Abu skaits kopā: $($darbojas + $aptureti)"
Write-Output "Kopējais servisu skaits: $($servisi.Count)"
