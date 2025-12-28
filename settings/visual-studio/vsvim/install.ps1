# link to windows home directory
# usage: run with admin right to create symlink
New-Item -ItemType Symboliclink -Force `
    -Path "$HOME\.vsvimrc" `
    -Target "$HOME\Documents\PowerShell\poshrc\settings\visual-studio\vsvim\vsvimrc"
