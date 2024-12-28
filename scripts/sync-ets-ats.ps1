# Define the file paths
$ets_path = "$HOME\Documents\Euro Truck Simulator 2\steam_profiles\6962726577636F666665656F6E7468656D6F6F6E"
$ats_path = "$HOME\Documents\American Truck Simulator\steam_profiles\6962726577636F666665656F6E7468656D6F6F6E"
$config_fname = "config_local.cfg"
$control_fname = "controls.sii"
$ets_config = "$ats_path\$config_fname"
$ats_config = "$ets_path\$config_fname"
$ets_control = "$ats_path\$control_fname"
$ats_control = "$ets_path\$control_fname"

Write-Host $ets_config
Write-Host $ats_config
Write-Host $ets_control
Write-Host $ats_control
