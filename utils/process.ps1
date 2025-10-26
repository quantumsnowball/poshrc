function ps() { tasklist }
function ps.ls() { tasklist | less }
function ps.search {
    param ([string]$processName)
    $processes = Get-Process | Where-Object { $_.Name -like "*$processName*" }
    if ($processes) {
        $processes | Format-Table -Property Id, Name, CPU, WS
    }
}
