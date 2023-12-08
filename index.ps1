oh-my-posh init pwsh | Invoke-Expression

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
