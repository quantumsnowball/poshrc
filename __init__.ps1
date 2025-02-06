# This is the symlink base path living inside of the $PROFILE's directory
$base = "$(Split-Path (Get-Item $PROFILE).FullName)\poshrc"

# init
. "$base\init\__init__.ps1"

# load plugins
. "$base\plugins\__init__.ps1"

# load alias
. "$base\utils\__init__.ps1"
