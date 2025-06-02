function Nvidia.ClearShaderCache {
    $shaderPaths = @(
        "$HOME\AppData\Local\NVIDIA\DXCache",
        "$HOME\AppData\Local\NVIDIA\GLCache"
    )

    Write-Host "=== Clearing NVIDIA Shader Caches ===" -ForegroundColor Cyan

    foreach ($path in $shaderPaths) {
        if (Test-Path $path) {
            Write-Host "Processing: $path" -ForegroundColor Magenta

            try {
                $items = Get-ChildItem -Path $path -Recurse -Force -ErrorAction Stop
                foreach ($item in $items) {
                    try {
                        Remove-Item -Path $item.FullName -Recurse -Force -ErrorAction Stop
                        Write-Host "✔ Deleted: $($item.FullName)" -ForegroundColor Green
                    } catch {
                        Write-Host "✖ Failed to delete: $($item.FullName) - $($_.Exception.Message)" -ForegroundColor Red
                    }
                }
            } catch {
                Write-Host "✖ Failed to list items in: $path - $($_.Exception.Message)" -ForegroundColor Red
            }
        } else {
            Write-Host "⚠ Path not found: $path" -ForegroundColor Yellow
        }
    }

    Write-Host "=== Done ===" -ForegroundColor Cyan
}

