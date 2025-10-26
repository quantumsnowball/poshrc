function powerplan.set {
    param (
        [string]$planName
    )

    # Get all available power plans
    $planList = powercfg /list

    # Check if the provided plan name exists in the list
    $planGuid = ($planList | Select-String -Pattern "^\s*Power Scheme GUID:.*\($planName\)$") -replace '.*: ', '' -replace '\s*\(.*\)', ''

    if ($planGuid) {
        powercfg /setactive $planGuid
        Write-Host "Switched to '$planName' power plan."
    } else {
        Write-Host "Error: Power plan '$planName' not found." -ForegroundColor Red
    }
}

