$base = Split-Path -Path (Get-Item $PROFILE).Target -Parent

# init
. "$base\init\__init__.ps1"

# load plugins
. "$base\plugins\__init__.ps1"

# load alias
. "$base\utils\__init__.ps1"
