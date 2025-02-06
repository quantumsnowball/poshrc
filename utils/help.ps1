Set-Alias wtfis wtf

function wtf {
    param (
        [string]$commandName
    )

    # Define color escape sequences
    $G = "`e[32m"
    $B = "`e[34m"
    $rs = "`e[0m"

    # Display command information
    Write-Host "`n>_ ${G}Get-Command${rs} ${B}$commandName${rs}"
    Get-Command -Name $commandName -All | Format-List

    Write-Host "`n>_ ${G}Get-Help${rs} ${B}$commandName${rs}"
    Get-Help $commandName -ErrorAction SilentlyContinue

    Write-Host "`n"
}
