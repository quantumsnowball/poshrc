$repo_dir = Split-Path -Path (Get-Item $PROFILE).Target -Parent

# load plugins
. "$repo_dir\plugins\index.ps1"

# load alias
. "$repo_dir\aliases\index.ps1"
