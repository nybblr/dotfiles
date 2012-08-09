[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Enable ctl-s shortcut for vim
# zsh
# alias vim="stty stop '' -ixoff ; vim"
# # `Frozing' tty, so after any command terminal settings will be restored
# ttyctl -f

# Set default editor/visual; don't fork GUI!
export VISUAL='mvim -f'
export EDITOR='mvim -f'

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
  local STTYOPTS="$(stty -g)"
  stty stop '' -ixoff
  command vim "$@"
  stty "$STTYOPTS"
}
