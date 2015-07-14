_load_z() {
  source $1/z.sh
}

[[ -f $ZSH_CUSTOM/plugins/z/z.plugin.zsh ]] && _load_z $ZSH_CUSTOM/plugins/z
[[ -f $ZSH/plugins/z/z.plugin.zsh ]] && _load_z $ZSH/plugins/z

# Check if the data file exists
# z uses _Z_DATA to indicate the data file, if not set, default is ~/.z
[ ! -f "${_Z_DATA:-$HOME/.z}" ] && touch ${_Z_DATA:-$HOME/.z}
