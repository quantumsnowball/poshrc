# prepare config content
$config = @"
service set-client-fov-tan-angle-multiplier 0.80 0.75
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

# let user read the result
Start-Sleep -Seconds 3
