# NOTE 
# clone this repo under $(Split-Path $PROFILE), this create the directory poshrc alongside with $PROFILE
# cd into poshrc/ execute ./install.ps1
# this will create symlink from $PROFILE file to poshrc/__init__.ps1
New-Item -ItemType Symboliclink -Force `
    -Path $PROFILE `
    -Target "C:\Users\$Env:USERNAME\Documents\PowerShell\poshrc\__init__.ps1"

