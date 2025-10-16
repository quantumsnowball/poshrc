function gamebar.reset {
    Write-Host "Stopping Broadcast DVR User Service..."
    Stop-Service -Name "BcastDVRUserService_*" -Force
    Write-Host "Done"

    Write-Host "Starting Broadcast DVR User Service..."
    Start-Service -Name "BcastDVRUserService_*"
    Write-Host "Done"
}
