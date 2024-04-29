param ($keywords)

$processes = Get-Process

foreach ($keyword in $keywords) {
    $matchingProcesses = $processes | Where-Object { $_.ProcessName -like "*$keyword*" }
    foreach ($process in $matchingProcesses) {
        try {
            $process | Stop-Process -Force -ErrorAction Stop
            Write-Host "Killed: $($process.ProcessName): $($process.Id)"
        }
        catch {
            Write-Host "Failed: $($process.ProcessName): $($process.Id)" -ForegroundColor Red
        }
    }
}
