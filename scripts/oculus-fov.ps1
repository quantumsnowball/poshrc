# params
param (
    [float]$fovH = 0.80,
    [float]$fovV = 0.75
)

# prepare config content
$config = @"
service set-client-fov-tan-angle-multiplier $fovH $fovV
service set-use-fov-stencil Off
service set-force-mip-gen-on-all-layers Off
server:asw.Off
exit
"@

$configPath = "./oculus-cli-config.txt" 

# save config file
Set-Content -Path $configPath -Value $config

# execute config file using OculusDebugToolCLI.exe
OculusDebugToolCLI.exe -f $configPath

# delete config file
Remove-Item -Path $configPath -Force

# restart OculusClient.exe
kill-them "OculusClient"
Start-Job -ScriptBlock { 
    Start-Process -FilePath "C:\Program Files\Oculus\Support\oculus-client\OculusClient.exe"
}

# let user read the result
Start-Sleep -Seconds 10
