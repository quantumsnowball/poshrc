# clear
Set-Alias -Name c -Value clear
Set-Alias -Name cl -Value clear

# reload
function rl { Start-Process powershell.exe -NoNewWindow -Wait; Exit }

# which
Set-Alias -Name which -Value Get-Command

# exit
function x { Exit }
