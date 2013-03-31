# Informative ls
alias la='ls -la'
alias lah='ls -lah'

# Git aliases
alias s='git status'
alias gcn='git clone'
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

# Middleman
alias mbd='middleman build --clean && middleman deploy --clean'
alias mmb='middleman build --clean'
alias mmd='middleman deploy --clean'

# Any build for any language
alias cbd='rm -r build/*'

# CMake
# OOS builds
alias cmake-build='cd build && cmake .. && cd ..'

# Processing
alias processing='processing-java --sketch=$PWD/ --output=$PWD/tmp/ --run --force'

# IPython
alias ipy='ipython'
alias ipq='ipython qtconsole'
alias ipqi='ipython qtconsole --pylab=inline'

# Quick web server
alias webserver='python -m SimpleHTTPServer'
