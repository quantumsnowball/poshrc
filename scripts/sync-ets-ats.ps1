# Define the file paths
$ets_path = "$HOME\Documents\Euro Truck Simulator 2\steam_profiles\6962726577636F666665656F6E7468656D6F6F6E"
$ats_path = "$HOME\Documents\American Truck Simulator\steam_profiles\6962726577636F666665656F6E7468656D6F6F6E"
$config_fname = "config_local.cfg"
$control_fname = "controls.sii"
$ets_config = "$ets_path\$config_fname"
$ats_config = "$ats_path\$config_fname"
$ets_control = "$ets_path\$control_fname"
$ats_control = "$ats_path\$control_fname"


function CompareReplace {
    param (
        [string]$text,
        [string]$ets_file,
        [string]$ats_file
    )
        # Check if both files exist
    if (-Not (Test-Path $ets_file)) {
        Write-Host "File does not exist: $ets_file"
        return
    }
    if (-Not (Test-Path $ats_file)) {
        Write-Host "File does not exist: $ats_file"
        return
    }

    # Get last modified times
    $ets_mod_time = (Get-Item $ets_file).LastWriteTime
    $ats_mod_time = (Get-Item $ats_file).LastWriteTime

    # Compare the files
    if (Compare-Object (Get-Content $ets_file) (Get-Content $ats_file)) {
        # title
        Write-Host "`nComparing ``$text`` files:"

        # Prompt user for action
        $choice = Read-Host "Which file to use? `n(1) ETS file ($ets_mod_time)`n(2) ATS file ($ats_mod_time)`n"
        if ($choice -eq '1') {
    #         # Copy-Item $ats_file -Destination $ets_file -Force
            Write-Host "ATS file has been replaced with ETS file."
        } elseif ($choice -eq '2') {
    #         # Copy-Item $ets_file -Destination $ats_file -Force
            Write-Host "ETS file has been replaced with ATS file."
        } else {
            Write-Host "Invalid choice. No files were replaced."
        }
    } else {
        Write-Host "No differences found. The files are identical."
    }
}

# Call the function to compare config and control files in both directories
CompareReplace -text "config_local.cfg" -ets_file $ets_config -ats_file $ats_config
CompareReplace -text "controls.sii" -ets_file $ets_control -ats_file $ats_control
