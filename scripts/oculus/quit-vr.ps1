# stop OVR service first
Stop-Service "OVRService"
Start-Sleep -Seconds 2

# then kill all related apps
kill-them steam,oculus,ovr,vr,meta
Start-Sleep -Seconds 5
