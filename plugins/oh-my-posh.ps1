$theme_path = "$PSScriptRoot\theme.json"

oh-my-posh init pwsh --config $theme_path | Invoke-Expression

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

