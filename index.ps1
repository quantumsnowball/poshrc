oh-my-posh init pwsh | Invoke-Expression

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

$repo_dir = Split-Path -Path (Get-Item $PROFILE).Target -Parent
# load alias
. "$repo_dir\aliases\index.ps1"
