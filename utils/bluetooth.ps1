# Restart the Bluetooth Support Service
function bluetooth.restart {
    Write-Host "Attempting to restart Bluetooth service..." -ForegroundColor Yellow
    Stop-Service -Name bthserv -Force
    Write-Host "Bluetooth service stopped." -ForegroundColor Green
    Start-Sleep -Seconds 1
    Start-Service -Name bthserv
    Write-Host "Bluetooth service started." -ForegroundColor Green
}
