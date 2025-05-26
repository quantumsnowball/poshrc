function Nvidia.ClearShaderCache {
    $dxCache = "$HOME\AppData\Local\NVIDIA\DXCache"
    $glCache = "$HOME\AppData\Local\NVIDIA\GLCache"

    Write-Host "Clearing NVIDIA shader caches..." -ForegroundColor Cyan

    foreach ($path in @($dxCache, $glCache)) {
        if (Test-Path $path) {
            try {
                Get-ChildItem -Path $path -Recurse -Force | Remove-Item -Force -Recurse
                Write-Host "Cleared: $path" -ForegroundColor Green
            } catch {
                Write-Warning "Failed to clear: $path - $_"
            }
        } else {
            Write-Host "Path not found: $path" -ForegroundColor Yellow
        }
    }

    # NOTE: some files may be locked by programs and will not delete
    # usually the windows manager or some graphics programs
    # e.g. SignalRGB
}

