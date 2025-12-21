# create the symbolic link replacing the original Overlays directory
# run with admin powershell
New-Item -ItemType Symboliclink -Force `
    -Path "C:\Program Files (x86)\RivaTuner Statistics Server\Plugins\Client\Overlays" `
    -Target "C:\Users\$Env:USERNAME\Documents\PowerShell\poshrc\settings\rivatuner\Overlays"

