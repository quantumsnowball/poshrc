$parent_dir = Split-Path -Parent $PSScriptRoot
$theme_path = Join-Path $parent_dir "theme/theme.json"

oh-my-posh init pwsh --config $theme_path | Invoke-Expression

