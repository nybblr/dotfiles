[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator # Load tmuxinator
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

# Set default editor/visual; don't fork GUI!
export VISUAL='mvim -f'
export EDITOR='mvim -f'

# No beer can, please
export HOMEBREW_NO_EMOJI=1

# Source bashrc for machine-centric config
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
