# zoxide 
# CAUTION: this script must run after oh-my-posh.ps1
Invoke-Expression (& { (zoxide init powershell | Out-String) })
