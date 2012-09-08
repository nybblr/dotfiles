[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

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

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
  local STTYOPTS="$(stty -g)"
  stty stop '' -ixoff
  command vim "$@"
  stty "$STTYOPTS"
}

# Source bashrc for machine-centric config
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi


# zsh colors
# ============================================================================
# This is a snippet of code to be placed inside your .bash_profile

# ============================================================================
# Bash convenience
#   -F  Append /: path, *: executable, @: symlink, |: FIFO
#   -G  Enable colorized output
#   -h  if -l, use unit suffixes for file sizes
#   -k  if -s, print size allocation in kilobytes, not blocks.
alias ls='ls -FGk'
function ll() {
    ls -lFGkha $1 | less
}


# ============================================================================
# SML: Color Prompt for virtualenv
#
source ~/.dotfiles/colorprompt.sh
# PROMPT_COMMAND=update_prompt

# file color highlights
export CLICOLOR=1

# Force color output even if not outputting to terminal (e.g. less)
export CLICOLOR_FORCE=1

# Default colors: exfxcxdxbxegedabagacad
# Current colors: Exfxbxdxcxegedabagacad
#   a black   c green   e blue     g cyan
#   b red     d brown   f magenta  h light grey
#   --- +++
#   ex  Ex    1.   directory
#   fx  fx    2.   symbolic link
#   cx  bx    3.   socket
#   dx  dx    4.   pipe
#   bx  cx    5.   executable
#   eg  eg    6.   block special
#   ed  ed    7.   character special
#   ab  ab    8.   executable with setuid bit set
#   ag  ag    9.   executable with setgid bit set
#   ac  ac    10.  directory writable to others, with sticky bit
#   ad  ad    11.  directory writable to others, without sticky bit
export LSCOLORS=Exfxbxdxcxegedabagacad
