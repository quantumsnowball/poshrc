# collect args as searching keywords
param ($kwargs)


# iterate through keywords
foreach ($keyword in $kwargs) {

    # get all process containing this keyword
    $procs = Get-Process | Where-Object { $_.ProcessName -like "*$keyword*" }

    # stop the process
    foreach ($p in $procs) {
        try {
            # raise any exception if failed
            $p | Stop-Process -Force -ErrorAction Stop
            Write-Host "Killed: $($p.ProcessName): $($p.Id)"
        }
        catch {
            Write-Host "Failed: $($p.ProcessName): $($p.Id)" -ForegroundColor Red
        }
    }
}
