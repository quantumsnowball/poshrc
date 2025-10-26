function powerplan {
    # Get the currently active power plan
    $currentPlan = powercfg /getactivescheme
    Write-Host "Current Active Power Plan:" -ForegroundColor Green
    Write-Host $currentPlan

    # List all available power plans
    Write-Host "`nAvailable Power Plans:" -ForegroundColor Cyan
    powercfg /list | ForEach-Object {
        Write-Host $_
    }
}

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

function powerplan.Balanced {
    powerplan.set 'Balanced'
}
function powerplan.High-Performance {
    powerplan.set 'High Performance'
}
function powerplan.Ultimate-Performance {
    powerplan.set 'Ultimate Performance'
}
