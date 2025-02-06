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
    Write-Output "`n>_ ${G}Get-Command${rs} ${B}$commandName${rs}"
    Get-Command -Name $commandName -All | Format-List

    Write-Output "`n>_ ${G}Get-Help${rs} ${B}$commandName${rs}"
    Get-Help $commandName -ErrorAction SilentlyContinue

    Write-Output "`n"

    # NOTE
    # sometime output is too long, can pipe it to pager
    # useful pager:
    #   less:
    #     winget install jftuga.less
    #   bat (use less):
    #     winget install sharkdp.bat
    #     to enable pager feature, run: $env:BAT_PAGER = 'less'
}
