# Always use local bin first
export PATH=/usr/local/bin:$PATH

# Source my local scripts
export PATH=$PATH:$HOME/.bin

# Source NPM packages
export PATH=$PATH:/usr/local/share/npm/bin

# Source NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm

# Prepend default node (fast)
export DEFAULT_NODE_DIR=($NVM_DIR/versions/node/v8.*/bin)
export PATH=${DEFAULT_NODE_DIR[1]}:$PATH

# Source python packages
# Unneeded as of latest Python
# Remove after pip install --upgrade
# export PATH=$PATH:/usr/local/share/python

# Set language (Lion bug)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set default editor/visual; don't fork GUI!
export VISUAL='mvim -f'
export EDITOR='mvim -f'

# No beer can, please
export HOMEBREW_NO_EMOJI=1

# Don't litter the home directory with rubies
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# Source profile for machine-centric config
if [ -f ~/.profile ]; then
  source ~/.profile
fi
