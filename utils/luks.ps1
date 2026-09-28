function luks.drives() {
    Get-CimInstance -Query "SELECT * from Win32_DiskDrive"
}

function luks.drives.rescan() {
    Write-Host "Scanning for newly powered SATA drives..." -ForegroundColor Cyan
    sudo pnputil /scan-devices
    Write-Host "Rescan complete!" -ForegroundColor Green
}
