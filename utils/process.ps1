function ps() { tasklist }
function ps.ls() { tasklist | less }
function ps.search {
    param ([string]$processName)
    $processes = Get-Process | Where-Object { $_.Name -like "*$processName*" }
    if ($processes) {
        $processes | Format-Table -Property Id, Name, CPU, WS
    }
}
function ps.search-kill {
    param ([string]$processName)

    # Start the loop, so it keeps running until the user presses Ctrl+C or quits
    while ($true) {
        # Get the list of matching processes
        $processes = Get-Process | Where-Object { $_.Name -like "*$processName*" }

        # If no processes found, exit
        if ($processes.Count -eq 0) {
            Write-Host "No processes found matching '$processName'. Exiting..." -ForegroundColor Yellow
            break
        }

        # Display the list of processes
        Write-Host "Found the following processes matching '$processName':" -ForegroundColor Yellow
        $processes | Format-Table -Property Id, Name, CPU, WS

        # Ask user to input the PID to kill, 'r' to refresh, or 'q' to quit
        $userInput = Read-Host "Enter process ID to kill, 'r' to refresh, or 'q' to quit"

        # Exit the loop if the user enters 'q'
        if ($userInput -eq 'q') {
            Write-Host "Exiting search-kill..." -ForegroundColor Yellow
            break
        }

        # Refresh the process list if the user enters 'r'
        if ($userInput -eq 'r') {
            Write-Host "Refreshing process list..." -ForegroundColor Cyan
            continue
        }

        # Try to kill the process if the user enters a valid PID
        if ($userInput -match '^\d+$') {
            $processId = [int]$userInput
            $selectedProcess = $processes | Where-Object { $_.Id -eq $processId }

            # If process is found, attempt to kill it
            if ($selectedProcess) {
                try {
                    $selectedProcess | Stop-Process
                    Write-Host "Killed process '$($selectedProcess.Name)' (PID: $($selectedProcess.Id))" -ForegroundColor Green

                    # Wait until the process is truly killed
                    $selectedProcess.WaitForExit()

                    # Confirm the process is killed
                    Write-Host "Process '$($selectedProcess.Name)' (PID: $($selectedProcess.Id)) has been terminated." -ForegroundColor Green
                } catch {
                    Write-Host "Failed to kill process '$($selectedProcess.Name)' (PID: $($selectedProcess.Id)). It may not exist or be inaccessible." -ForegroundColor Red
                }
            } else {
                Write-Host "No process found with PID $processId." -ForegroundColor Red
            }
        } else {
            Write-Host "Invalid input. Please enter a valid process ID, 'r' to refresh, or 'q' to quit." -ForegroundColor Red
        }
    }
}
