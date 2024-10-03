param (
    [ValidateSet("Enable", "Restore")]
    [string]$action = 'Restore'
)

# const
$OCULUS_DASH_DIR = "C:\Program Files\Oculus\Support\oculus-dash\dash\bin"
$OCULUS_KILLER_DIR = $OCULUS_DASH_DIR
$ORIGINAL_DASH_FNAME = "OculusOriginalDash.exe"
$KILLER_DASH_FNAME = "OculusKillerDash.exe"
$DASH_FNAME = "OculusDash.exe"
$OCULUS_ORIGINAL_DASH_SRC = "$OCULUS_KILLER_DIR\$ORIGINAL_DASH_FNAME"
$OCULUS_KILLER_DASH_SRC = "$OCULUS_KILLER_DIR\$KILLER_DASH_FNAME"
$OCULUS_DASH_SYMLINK = "$OCULUS_DASH_DIR\$DASH_FNAME"

# kill every process related
kill-them.ps1 steam,oculus,ovr,vr,meta
Start-Sleep -Seconds 1

# remove the old symlink
Remove-Item $OCULUS_DASH_SYMLINK -Force

# create 
switch ($Action) {
    "Enable" {
        # Create a symbolic link to the killer dash source
        New-Item -ItemType SymbolicLink -Path $OCULUS_DASH_SYMLINK -Target $OCULUS_KILLER_DASH_SRC
        Write-Host "`nOculus Killer Dash Enabled: $DASH_FNAME -> $KILLER_DASH_FNAME`n"
    }
    "Restore" {
        # Create a symbolic link to the original dash source
        New-Item -ItemType SymbolicLink -Path $OCULUS_DASH_SYMLINK -Target $OCULUS_ORIGINAL_DASH_SRC
        Write-Host "`nOculus Original Dash Restored: $DASH_FNAME -> $ORIGINAL_DASH_FNAME`n"
    }
}
