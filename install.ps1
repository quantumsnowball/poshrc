# NOTE 
# Execute this file using PowerShell v7 under the repo root directory
#

# create symlink from $PROFILE file to repo __init__.ps1
New-Item -ItemType Symboliclink -Force `
    -Path $PROFILE `
    -Target "\\wsl.localhost\Arch\home\$Env:USERNAME\.config\poshrc\__init__.ps1"

# create symlink inside $PROFILE's directory for this repo directory on the windows side 
# this is needed for __init__.ps1 to be able to locate all other modules
New-Item -ItemType Symboliclink -Force `
    -Path "$(Split-Path $PROFILE)\poshrc" `
    -Target "\\wsl.localhost\Arch\home\$Env:USERNAME\.config\poshrc\"
