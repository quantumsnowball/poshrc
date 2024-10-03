param (
    [ValidateSet("Enable", "Restore")]
    [string]$action = 'Restore'
)
# kill everything related

# 
$OCULUS_DASH_DIR = "C:\Program Files\Oculus\Support\oculus-dash\dash\bin"
$OCULUS_ORIGINAL_DASH_SRC = "C:\Program Files\OculusKiller\OculusDash.exe.bak"
$OCULUS_KILLER_DASH_SRC = "C:\Program Files\OculusKiller\OculusDash.exe"
$OCULUS_DASH_SYMLINK = "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe"


# Create a symbolic link to the killer dash source
New-Item -ItemType SymbolicLink -Path $OCULUS_DASH_SYMLINK -Target $OCULUS_KILLER_DASH_SRC
Write-Host "Symbolic link created from '$OCULUS_DASH_SYMLINK' to '$OCULUS_KILLER_DASH_SRC'"
