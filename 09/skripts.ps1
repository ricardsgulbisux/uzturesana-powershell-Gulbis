foreach ($p in Get-CimInstance Win32_Process) {
    $u = Invoke-CimMethod -InputObject $p -MethodName GetOwner
    Write-Output "$($p.Name): $($u.User)"
}