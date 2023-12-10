$base = Split-Path -Path (Get-Item $PROFILE).Target -Parent

# load plugins
. "$base\plugins\__init__.ps1"

# load alias
. "$base\aliases\__init__.ps1"
