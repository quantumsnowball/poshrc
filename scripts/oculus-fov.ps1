# params
param (
    [float]$FOV_H = 0.80,
    [float]$FOV_V = 0.75
)

# constants
$CONFIG_PATH = "./oculus-cli-config.txt" 
$CLIENT_NAME = "OculusClient"
$CLIENT_PATH = "C:\Program Files\Oculus\Support\oculus-client\$CLIENT_NAME.exe"
$WAIT_SEC = 10
$CONFIG = @"
service set-client-fov-tan-angle-multiplier $FOV_H $FOV_V
service set-use-fov-stencil Off
service set-force-mip-gen-on-all-layers Off
server:asw.Off
exit
"@

# save config file
Set-Content -Path $CONFIG_PATH -Value $CONFIG

# execute config file using OculusDebugToolCLI.exe
OculusDebugToolCLI.exe -f $CONFIG_PATH

# delete config file
Remove-Item -Path $CONFIG_PATH -Force

# restart OculusClient.exe
kill-them $CLIENT_NAME
Start-Job -ScriptBlock { 
    param ($path)
    Start-Process -FilePath $path
} -ArgumentList $CLIENT_PATH

# let user read the result
Start-Sleep -Seconds $WAIT_SEC
