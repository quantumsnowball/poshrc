# clear
Set-Alias -Name c -Value clear
Set-Alias -Name cl -Value clear

# reload
function posh.reload-shell { Start-Process pwsh -NoNewWindow -Wait; Exit }
Set-Alias -Name rr -Value posh.reload-shell

# exit
function posh.exit { exit }
Set-Alias -Name x -Value posh.exit
Set-Alias -Name q -Value posh.exit

# which
Set-Alias -Name which -Value Get-Command

# exit
function x { Exit }

# popup
function popup.info {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [string]$Title = "System Notification"
    )

    # Ensure the GUI library is loaded
    Add-Type -AssemblyName System.Windows.Forms
    
    # Display the box
    [System.Windows.Forms.MessageBox]::Show($Message, $Title, "OK", "Information")
}
