# clear
Set-Alias -Name c -Value clear
Set-Alias -Name cl -Value clear

# reload
function rr { Start-Process pwsh -NoNewWindow -Wait; Exit }

# which
Set-Alias -Name which -Value Get-Command

# exit
function x { Exit }
