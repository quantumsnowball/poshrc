# params
param (
    [int]$MODE = 1
)

$CONFIG_PATH = "./oculus-cli-config.txt" 
$CONFIG = @"
perfhud set-mode $MODE
exit
"@
$INFO_WAIT = 1

# save config file
Set-Content -Path $CONFIG_PATH -Value $CONFIG

# execute config file using OculusDebugToolCLI.exe
OculusDebugToolCLI.exe -f $CONFIG_PATH

# delete config file
Remove-Item -Path $CONFIG_PATH -Force

# let user read the result
Start-Sleep -Seconds $INFO_WAIT
