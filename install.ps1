# $home_dir = $HOME
# $profile_dir = 'Documents\WindowsPowerShell'
# $profile_fname = 'Microsoft.PowerShell_profile.ps1'
# $install_dir = "{0}\{1}\{2}" -f $home_dir, $profile_dir, $profile_fname
# Write-Output $install_dir

# create symbolic link from $PROFILE file to repo index.ps1
New-Item -ItemType Symboliclink -Force `
    -Path $PROFILE `
    -Target "./index.ps1"
