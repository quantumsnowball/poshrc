function luks.drives() {
    Get-CimInstance -Query "SELECT * from Win32_DiskDrive"
}

function luks.drives.rescan() {
    Write-Host "Scanning for newly powered SATA drives..." -ForegroundColor Cyan
    sudo pnputil /scan-devices
    Write-Host "Rescan complete!" -ForegroundColor Green
}

function luks.mount {
    param (
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Ids
    )

    foreach ($id in $Ids) {
        Write-Host "Mounting PHYSICALDRIVE$id to WSL..." -ForegroundColor Cyan
        sudo wsl --mount "\\.\PHYSICALDRIVE$id" --bare
    }
}
