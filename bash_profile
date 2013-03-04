[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc" # Load pythonbrew

# Source my local scripts
export PATH=$PATH:$HOME/.bin

# Source NPM packages
export PATH=$PATH:/usr/local/share/npm/bin

# Source python packages
export PATH=$PATH:/usr/local/share/python

# Set language (Lion bug)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Enable ctl-s shortcut for vim
# zsh
# alias vim="stty stop '' -ixoff ; vim"
# # `Frozing' tty, so after any command terminal settings will be restored
# ttyctl -f

# Set default editor/visual; don't fork GUI!
export VISUAL='mvim -f'
export EDITOR='mvim -f'

# No beer can, please
export HOMEBREW_NO_EMOJI=1

# # zsh
# alias vim="stty stop '' -ixoff ; vim"
# # 'Frozing' tty, so after any command terminal settings will be restored
# ttyctl -f
# 
# # bash
# # No ttyctl, so we need to save and then restore terminal settings
# vim()
# {
#   local STTYOPTS="$(stty -g)"
#   stty stop '' -ixoff
#   command vim "$@"
#   stty "$STTYOPTS"
# }

# Source bashrc for machine-centric config
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
