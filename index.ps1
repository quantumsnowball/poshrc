$base = Split-Path -Path (Get-Item $PROFILE).Target -Parent

# load plugins
. "$base\plugins\index.ps1"

# load alias
. "$base\aliases\index.ps1"
