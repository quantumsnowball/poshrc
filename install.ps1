# create symbolic link from $PROFILE file to repo index.ps1
New-Item -ItemType Symboliclink -Force `
    -Path $PROFILE `
    -Target "./__init__.ps1"
