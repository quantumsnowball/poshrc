Get-ChildItem -Path $PSScriptRoot -Filter "*.ps1" | ForEach-Object {
    if ($_.Name -ne "__init__.ps1") {
        . "$PSScriptRoot\$($_.Name)"
    }
}
