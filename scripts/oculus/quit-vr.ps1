# stop OVR service first
Stop-Service "OVRService"
Start-Sleep -Seconds 2

# then kill all related apps
kill-them steam,oculus,ovr,vr,meta,adb,alvr
Start-Sleep -Seconds 5

# switch to PC speaker
Set-AudioDevice -Index 1
