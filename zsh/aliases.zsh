# Informative ls
alias la='ls -la'
alias lah='ls -lah'

# View commands
alias lr='less -R'
alias tf='tail -f'

# Git aliases
alias s='git status -sb'
alias si='git status -sb --ignored'
alias gcn='git clone'
alias gum='git commit -am'
gump() { gum "$*" && git push }
alias gam='git add -A && git commit -m'
gamp() { gam "$*" && git push }
alias gap='git add -p'
alias ganp='git add -N . && git add -p'
alias gd='git diff'
alias gdt='git difftool --no-prompt'
alias gwd='git diff --color-words'
alias gcm='git commit -m'
gcmp() { gcm "$*" && git push}
alias gptg='git push --tags'

alias gff='git pull --ff-only'
alias gfm='git pull --no-ff'

alias ggl='git log --oneline --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'

alias gdm='git diff `git merge-base master HEAD`'

alias fix='$EDITOR `git diff --name-only | uniq`'

# Diffs
# alias cwdiff='wdiff -n -w $'"'"'\033[30;41m'"'"' -x $'"'"'\033[0m'"'"' -y $'"'"'\033[30;42m'"'"' -z $'"'"'\033[0m'"'"' \]'"'"

# Tmux
alias tls='tmux list-sessions'
alias tas='tmux attach-session -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'
alias tds='tmux detach-client'

# Pasteboard
alias pbch='textutil -format html -convert rtf -stdin -stdout | pbcopy -Prefer rtf'
alias hi='highlight -s solarized-light -O rtf'

# Heroku
alias hpr='git push heroku master && heroku restart'

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

# Quick MacVim
alias v='vim'
alias m='mvim'

# Finder
alias o='open .'
alias showdots='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidedots='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
