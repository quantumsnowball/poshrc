function gamebar.reset {
    Write-Host "Finding the exact name of the Broadcast DVR User Service..." -ForegroundColor 'yellow'

    # Get all services that match the pattern
    $services = Get-Service -ErrorAction SilentlyContinue | Where-Object { $_.Name -like "BcastDVRUserService_*" }

    # Ensure that at least one service is found
    if ($services.Count -eq 0) {
        Write-Host "No matching service found." -ForegroundColor 'red'
        return
    }

    # Get the exact service name (assuming there's only one match)
    $serviceName = $services[0].Name

    # Get the PID of the service using sc queryex
    $serviceDetails = sc queryex $serviceName
    $processId = ($serviceDetails | Select-String -Pattern "PID\s+:\s*(\d+)").Matches.Groups[1].Value
    Write-Host "Exact service name: $serviceName, PID: $processId" -ForegroundColor 'yellow'

    if ($processId) {
        Write-Host "Killing the process with PID: $processId..." -ForegroundColor 'yellow'
        Stop-Process -Id $processId -Force -ErrorAction SilentlyContinue
        Write-Host "Process terminated." -ForegroundColor 'green'
    } else {
        Write-Host "PID not found or service not running." -ForegroundColor 'red'
    }

    # Restart the service after some delay
    Sleep 2
    Write-Host "Starting the service..."  -ForegroundColor 'yellow'
    Start-Service -Name $serviceName

    # Check if the service started successfully
    $serviceStatus = (Get-Service -Name $serviceName).Status

    if ($serviceStatus -eq 'Running') {
        Write-Host "Service restarted successfully." -ForegroundColor 'green'
    } else {
        Write-Host "Failed to start the service." -ForegroundColor 'red'
    }
}
