param (
    [ValidateSet("Enable", "Restore")]
    [string]$action = 'Restore'
)

# const
$OCULUS_DASH_DIR = "C:\Program Files\Oculus\Support\oculus-dash\dash\bin"
$OCULUS_ORIGINAL_DASH_SRC = "C:\Program Files\OculusKiller\OculusDash.exe.bak"
$OCULUS_KILLER_DASH_SRC = "C:\Program Files\OculusKiller\OculusDash.exe"
$OCULUS_DASH_SYMLINK = "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe"

# kill every process related
kill-them.ps1 steam,oculus,ovr,vr,meta

# remove the old symlink
Remove-Item $OCULUS_DASH_SYMLINK -Force

# create 
switch ($Action) {
    "Enable" {
        # Create a symbolic link to the killer dash source
        New-Item -ItemType SymbolicLink -Path $OCULUS_DASH_SYMLINK -Target $OCULUS_KILLER_DASH_SRC
        Write-Host "`nOculus Killer Dash Enabled: `n$OCULUS_DASH_SYMLINK`n -> $OCULUS_KILLER_DASH_SRC"
    }
    "Restore" {
        # Create a symbolic link to the original dash source
        New-Item -ItemType SymbolicLink -Path $OCULUS_DASH_SYMLINK -Target $OCULUS_ORIGINAL_DASH_SRC
        Write-Host "`nOculus Original Dash Restored: `n$OCULUS_DASH_SYMLINK`n -> $OCULUS_ORIGINAL_DASH_SRC"
    }
}
