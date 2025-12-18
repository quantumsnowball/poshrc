# link to windows home directory
# usage: run with admin right to create symlink
New-Item -ItemType Symboliclink -Force `
    -Path "$HOME\.vsvimrc" `
    -Target "\\wsl.localhost\Arch\home\$Env:USERNAME\.config\poshrc\settings\visual-studio\vsvim\vsvimrc"
