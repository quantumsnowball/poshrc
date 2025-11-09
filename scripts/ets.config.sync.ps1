# Define the file paths
$ETS_PATH = "$HOME\Documents\Euro Truck Simulator 2\steam_profiles"
$ATS_PATH = "$HOME\Documents\American Truck Simulator\steam_profiles"
$CONFIG_FNAME = "config_local.cfg"
$CONTROL_FNAME = "controls.sii"

# Function to get the last modified directory name that matches the criteria
function Get-LastModifiedDir {
    param (
        [string]$base_path
    )

    # Get directories and sort by LastWriteTime
    $dirs = Get-ChildItem -Path $base_path -Directory | Sort-Object LastWriteTime -Descending
    return $dirs[0].Name  # Return the name of the last modified directory
}

# Get the last modified directory names
$ets_profile_id = Get-LastModifiedDir -base_path $ETS_PATH
$ats_profile_id = Get-LastModifiedDir -base_path $ATS_PATH

# Check if the last modified directory names are the same
if ($ets_profile_id -ne $ats_profile_id) {
    Write-Host "Error: The last modified directories under steam_profiles/ are different."
    Write-Host "ETS dir: $ets_profile_id"
    Write-Host "ATS dir: $ats_profile_id"
    
    # exit script if dirname are differnt
    return  
}

$profile_id = $ets_profile_id
Write-Host "Steam profile directory:`n$profile_id`n"

$ets_config = "$ETS_PATH\$profile_id\$CONFIG_FNAME"
$ats_config = "$ATS_PATH\$profile_id\$CONFIG_FNAME"
$ets_control = "$ETS_PATH\$profile_id\$CONTROL_FNAME"
$ats_control = "$ATS_PATH\$profile_id\$CONTROL_FNAME"


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

    # Show section title
    Write-Host "Comparing ``$text`` files:"

    # Compare the files
    if (Compare-Object (Get-Content $ets_file) (Get-Content $ats_file)) {
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
            Write-Host "ETS file has replaced ATS file."
        } elseif ($choice -eq '2') {
            Copy-Item $ets_file -Destination $ets_backup -Force
            Copy-Item $ats_file -Destination $ets_file -Force
            Write-Host "ATS file has replaced ETS file."
        } else {
            Write-Host "Invalid choice. No files were replaced."
        }

        # print result
        Write-Host (
        "ETS file ($((Get-Item $ets_file).LastWriteTime))`n" + 
        "ATS file ($((Get-Item $ats_file).LastWriteTime))`n")
    } else {
        Write-Host "No differences found. The files are identical.`n"
    }
}

# Call the function to compare config and control files in both directories
CompareReplace -text "config_local.cfg" -ets_file $ets_config -ats_file $ats_config
CompareReplace -text "controls.sii" -ets_file $ets_control -ats_file $ats_control

# hold the terminal, press enter to close
pause
