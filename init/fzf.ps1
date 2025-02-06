$env:FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --border"

# PSfzf
# installation command: Install-Module -Name PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
