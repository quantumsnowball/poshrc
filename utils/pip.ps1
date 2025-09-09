# install
function pip.install {
    param([Parameter(ValueFromRemainingArguments=$true)] $Args)
    pip install @Args
}
Set-Alias pipi pip.install

# INSTALL EDITABLE
function pip.install.editable {
    param([Parameter(ValueFromRemainingArguments=$true)] $Args)
    pip install -e @Args
}
Set-Alias pipi.e pip.install.editable

# list
function pip.ls {
    pip list
}
Set-Alias pipls pip.ls

# remove
function pip.remove {
    param([Parameter(ValueFromRemainingArguments=$true)] $Args)
    pip uninstall @Args
}
Set-Alias piprm pip.remove

# update
function pip.update {
    pip list --outdated
}
Set-Alias pipu pip.update
