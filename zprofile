# Always use local bin first
export PATH=/usr/local/bin:$PATH

# Source my local scripts
export PATH=$PATH:$HOME/.bin

# Source NPM packages
export PATH=$PATH:/usr/local/share/npm/bin

# Source python packages
# Unneeded as of latest Python
# Remove after pip install --upgrade
# export PATH=$PATH:/usr/local/share/python

# Source boxen environment
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Set language (Lion bug)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set default editor/visual; don't fork GUI!
export VISUAL='mvim -f'
export EDITOR='mvim -f'

# No beer can, please
export HOMEBREW_NO_EMOJI=1

# Source profile for machine-centric config
if [ -f ~/.profile ]; then
  source ~/.profile
fi
