param ($keywords)

$processes = Get-Process

foreach ($keyword in $keywords) {
    $matchingProcesses = $processes | Where-Object { $_.ProcessName -like "*$keyword*" }
    foreach ($process in $matchingProcesses) {
        $process | Stop-Process -Force
        Write-Host "Killed: $($process.ProcessName): $($process.Id)"
    }
}
