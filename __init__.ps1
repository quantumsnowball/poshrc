$base = "$(Split-Path (Get-Item $PROFILE).FullName)\poshrc"

# init
. "$base\init\__init__.ps1"

# load plugins
. "$base\plugins\__init__.ps1"

# load alias
. "$base\utils\__init__.ps1"
