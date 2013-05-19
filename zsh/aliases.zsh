# Informative ls
alias la='ls -la'
alias lah='ls -lah'

# Git aliases
alias s='git status -sb'
alias si='git status -sb --ignored'
alias gcn='git clone'
alias gum='git commit -am'
gump() { gum "$*" && git push }
alias gam='git add -A && git commit -m'
gamp() { gam "$*" && git push }
alias gd='git diff'
alias gwd='git diff --color-words'
alias gcm='git commit -m'
gcmp() { gcm "$*" && git push}
alias gptg='git push --tags'

alias gff='git pull --ff-only'
alias gfm='git pull --no-ff'

# git-smart aliases
alias gsl='git smart-pull'
alias gslg='git smart-log'
alias gsm='git smart-merge'

# Diffs
# alias cwdiff='wdiff -n -w $'"'"'\033[30;41m'"'"' -x $'"'"'\033[0m'"'"' -y $'"'"'\033[30;42m'"'"' -z $'"'"'\033[0m'"'"' \]'"'"

# Middleman
alias mbd='middleman build --clean && middleman deploy --clean'
alias mmb='middleman build --clean'
alias mmd='middleman deploy --clean'

# rbenv/rvm
alias rbv='rbenv'
alias rbsys='rbenv use system'
alias rbdef='rbenv use default'
alias rb19='rbenv use 1.9.3'
alias rb20='rbenv use 2.0.0'

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
