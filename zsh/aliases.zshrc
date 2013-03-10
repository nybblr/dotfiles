# Informative ls
alias la='ls -la'

# Git aliases
alias s='git status'
alias gum='git commit -am'
# alias gump='gum && git push'
alias gam='git add -A && git commit -m'
# alias gamp='gam && git push'
alias gd='git diff'
alias gcm='git commit -m'
alias gptg='git push --tags'

# git-smart aliases
alias gsl='git smart-pull'
alias gslg='git smart-log'
alias gsm='git smart-merge'

# CMake
# OOS builds
alias cmake-build='cd build && cmake .. && cd ..'
alias cmake-clean='rm -rf build/*'

# Processing
alias processing='processing-java --sketch=$PWD/ --output=$PWD/tmp/ --run --force'

# IPython
alias ipy='ipython'
alias ipq='ipython qtconsole'
alias ipqi='ipython qtconsole --pylab=inline'

# Quick web server
alias webserver='python -m SimpleHTTPServer'
