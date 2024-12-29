# Define the file paths
$ETS_PATH = "$HOME\Documents\Euro Truck Simulator 2\steam_profiles\6962726577636F666665656F6E7468656D6F6F6E"
$ATS_PATH = "$HOME\Documents\American Truck Simulator\steam_profiles\6962726577636F666665656F6E7468656D6F6F6E"
$CONFIG_FNAME = "config_local.cfg"
$CONTROL_FNAME = "controls.sii"
$ets_config = "$ETS_PATH\$CONFIG_FNAME"
$ats_config = "$ATS_PATH\$CONFIG_FNAME"
$ets_control = "$ETS_PATH\$CONTROL_FNAME"
$ats_control = "$ATS_PATH\$CONTROL_FNAME"


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

    # Compare the files
    if (Compare-Object (Get-Content $ets_file) (Get-Content $ats_file)) {
        # title
        Write-Host "Comparing ``$text`` files:"

        # Prompt user for action
        $choice = Read-Host (
        "Which file to use? `n" +
        "(1) ETS file ($((Get-Item $ets_file).LastWriteTime))`n" + 
        "(2) ATS file ($((Get-Item $ats_file).LastWriteTime))`n")

        # Backup filenames with timestamp
        $timestamp = (Get-Date).ToString("yyyyMMdd-HHmmss")
        $ets_backup = "$ets_file.$timestamp.bak"
        $ats_backup = "$ats_file.$timestamp.bak"

        # Replace the files
        if ($choice -eq '1') {
            Copy-Item $ats_file -Destination $ats_backup -Force
            Copy-Item $ets_file -Destination $ats_file -Force
            Write-Host "ETS file has been replaced with ATS file."
        } elseif ($choice -eq '2') {
            Copy-Item $ets_file -Destination $ets_backup -Force
            Copy-Item $ats_file -Destination $ets_file -Force
            Write-Host "ATS file has been replaced with ETS file."
        } else {
            Write-Host "Invalid choice. No files were replaced."
        }

        # print result
        Write-Host (
        "ETS file ($((Get-Item $ets_file).LastWriteTime))`n" + 
        "ATS file ($((Get-Item $ats_file).LastWriteTime))`n")
    } else {
        Write-Host "No differences found. The files are identical."
    }
}

# Call the function to compare config and control files in both directories
CompareReplace -text "config_local.cfg" -ets_file $ets_config -ats_file $ats_config
CompareReplace -text "controls.sii" -ets_file $ets_control -ats_file $ats_control

# hold the terminal, press enter to close
pause
