# create symbolic link from $PROFILE file to repo index.ps1
New-Item -ItemType Symboliclink -Force `
    -Path $PROFILE `
    -Target "\\wsl.localhost\Arch\home\$Env:USERNAME\.config\poshrc\__init__.ps1"

New-Item -ItemType Symboliclink -Force `
    -Path "$(Split-Path $PROFILE)\poshrc" `
    -Target "\\wsl.localhost\Arch\home\$Env:USERNAME\.config\poshrc\"
