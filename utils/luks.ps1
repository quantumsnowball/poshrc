function luks.drives() {
    Get-CimInstance -Query "SELECT * from Win32_DiskDrive"
}
