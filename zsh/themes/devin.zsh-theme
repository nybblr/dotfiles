# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' get-revision true
zstyle ':vcs_info:*:*' unstagedstr '*'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "[%s:%b:%.7i%u%c%F{green}|%a%m]"
zstyle ':vcs_info:*:*' formats "[%s:%b:%.7i%u%c%m]"
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
		hook_com[unstaged]+='?'
	fi
}

### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
function +vi-git-aheadbehind() {
	local ahead behind
	local -a gitstatus

	ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | sed 's/^[ \t]*//;s/[ \t]*$//')
	(( $ahead )) && gitstatus+=( "%F{cyan}|+${ahead}%F{yellow}" )

	behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | sed 's/^[ \t]*//;s/[ \t]*$//')
	(( $behind )) && gitstatus+=( "%F{red}|-${behind}%F{yellow}" )

	hook_com[misc]+="${(j::)gitstatus}"
}

function update_prompt() {
	# Easy cursors
	SaveCursor='[s'
	LoadCursor='[u'
	CursorDown='[1B'
	CursorBack3='[3D'
	CursorForw='[1C'
	CursorUp='[1A'

	# Easier color names
	local color=""
	for color in red green yellow blue magenta cyan black white; do
		eval  $color='%{$fg_no_bold[${color}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
		eval b$color='%{$fg_bold[${color}]%}'
	done
	eval reset='%{$reset_color%}'


	local vcp='${yellow}${vcs_info_msg_0_}'
	local prim_sudo="%(!.$red.$cyan)"
	local sec_sudo="%(!.$red.$cyan)"
	local user_host="%(!.$red.$cyan)%n@%m:$reset"
	# local subshell="$yellow(${byellow}subshell:%L$yellow)$reset"
	# local dir="$blue%~/$reset"
	# local dir="$blue%4(~:...:)%3~/$reset"
	local dir="$blue%50<..<%~$reset"
	GREP_COLOR='22;34'
	# local dir='${bblue}$(pwd|grep --color=always /)'
	local hist="${sec_sudo}[%!]"
	# local date=" $sec_sudo%*$reset"
	local date=""
	local uid="$blue$prim_sudo>%(2L.>>.)$reset"

## Prompt with nice cursor inset. Causes issue with autocomplete though =(
# PROMPT="
# ${user_host} ${cpu} ${vcp} ${date}${reset}
# ${dir}${reset}
# ${hist}${uid}${SaveCursor}${reset} "

	PROMPT="$user_host$reset $dir$reset $uid$reset "

	# PS2='${yellow}[u[1B[3D...[s ${byellow}%(1_.%_ ${yellow}> .)${reset}'
	# PROMPT2='${blue}${LoadCursor}${CursorDown}${CursorBack3}...${SaveCursor} ${bblue}%(1_.%_ ${blue}> .)${reset}'
	PROMPT2=' $green... %(1_.%_ > .)$reset'
	PROMPT4='$cyan+$bcyan%N$cyan:$bcyan%i$cyan >$reset '

# PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '

	# Vi-Mode
	vimode='$(vi_mode_prompt_info)'

	# Ruby version
	rbv=''
	if [[ -s ~/.rvm/scripts/rvm ]] ; then
		rbv='$(~/.rvm/bin/rvm-prompt s i v p g | sed -e "s/ruby-//")'
	else
		if which rbenv &> /dev/null; then
			rbv='$(rbenv version | sed -e "s/ (set.*$//")'
		fi
	fi

	# Python version
	pyv=''
	if [[ -s ~/.pythonbrew/bin/pythonbrew ]] ; then
		pyv='$(python --version 2>&1 | sed -e "s/Python //")'
	fi

	if [[ ! -z $rbv ]] ; then
		RPROMPT="$vimode$vcp${green}[$rbv|$pyv]$reset$hist$date$reset"
	else
		RPROMPT="$vimode$vcp$hist$date$reset"
	fi

	if [[ ! -z $EPS1 ]] ; then
		RPROMPT="$RPROMPT $EPS1"
	fi

}

update_prompt
