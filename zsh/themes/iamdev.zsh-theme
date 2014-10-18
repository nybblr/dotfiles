# Pretty colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
# zstyle ':vcs_info:*:*' get-revision true
zstyle ':vcs_info:*:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*:*' stagedstr "%F{red}"
zstyle ':vcs_info:*:*' actionformats "%F{blue}%b %m%F{green}%u%c● %F{red}%a"
zstyle ':vcs_info:*:*' formats       "%F{blue}%b %m%F{green}%u%c●"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-aheadbehind

### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
function +vi-git-untracked(){
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    # git status --porcelain | grep '??' &> /dev/null ; then
    # This will show the marker if there are any untracked files in repo.
    # If instead you want to show the marker only if there are untracked
    # files in $PWD, use:
    [[ -n $(git ls-files --others --exclude-standard) ]] ; then
    hook_com[unstaged]="%F{yellow}"$hook_com[unstaged]
  fi
}

### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
function +vi-git-aheadbehind() {
  local ahead behind
  local -a gitstatus

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | sed 's/^[ \t]*//;s/[ \t]*$//')
  (( $ahead )) && gitstatus+=( "%F{magenta}+${ahead}" )

  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | sed 's/^[ \t]*//;s/[ \t]*$//')

  (( $ahead )) && (( $behind )) && gitstatus+="%F{yellow}/"

  (( $behind )) && gitstatus+=( "%F{magenta}-${behind}" )

  if [[ -n "$gitstatus" ]] ; then
    hook_com[misc]+="${(j::)gitstatus} "
  fi
}

function ruby_version() {
  local rbv=''
  if [[ -s ~/.rvm/scripts/rvm ]] ; then
    rbv='$(~/.rvm/bin/rvm-prompt s i v p g | sed -e "s/ruby-//")'
  else
    if which rbenv &> /dev/null; then
      rbv='$(rbenv version | sed -e "s/ (set.*$//")'
    fi
  fi
  echo $rbv
  # TODO: Catch "this ruby not installed" error and indicate with red.
}

function python_version() {
  local pyv=''
  if [[ -s ~/.pythonbrew/bin/pythonbrew ]] ; then
    pyv='$(python --version 2>&1 | sed -e "s/Python //")'
  fi
  echo $pyv
}

function fancy_directory() {
  # local dir='$(echo ${(%):-%50<..<%~} | GREP_COLORS="mt=01;30:sl=01;32" grep --color=always / | sed -E "s/"$'"'"'\E'"'"'"\[K$//g")'
  local dir='$(echo ${(%):-%50<..<%~})'
  echo $dir
}

function update_prompt() {
  # Easier color names
  local color=""
  for color in red green yellow blue magenta cyan black white; do
    eval  $color='%{$fg_no_bold[${color}]%}'
    eval b$color='%{$fg_bold[${color}]%}'
  done
  eval reset='%{$reset_color%}'

  local vcp='${vcs_info_msg_0_}'
  local dir="$(fancy_directory)"

  PROMPT2=' $yellow... %(1_.%_ > .)$reset'
  PROMPT4='$cyan+$bcyan%N$cyan:$bcyan%i$cyan >$reset '

  # Vi-Mode
  vimode="$(vi_mode_prompt_info)"

  # Ruby version
  local rbv="$(ruby_version)"

  IAMDEV_RUBY_="$magenta${rbv}"

  IAMDEV_GIT_="${vcp} "
  IAMDEV_PROMPT_="$yellow» "
  IAMDEV_DIR_="${dir}"

  # Put it all together!
  PROMPT="$IAMDEV_GIT_$IAMDEV_PROMPT_$reset"
  RPROMPT="$vimode $IAMDEV_DIR_ $IAMDEV_RUBY_$reset"

  # TODO: make all these vars and functions local!
}

update_prompt
