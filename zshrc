source $HOME/.bash_profile
# source /etc/profile

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="devin"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew python bundler git gem rvm rake rails3 osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# I am a confident typist. Don't need zsh to correct me.
unsetopt correct_all

# Modular configs
setopt nullglob
for zconfig in ~/.zsh/*.zshrc
do
	source $zconfig
done

# Growl function that I'll never use
growl() { echo -e $'\e]9;'${1}'\007' ; return ; }






# # Bookmarks!
# source ~/.zshmarks
# function zmark() {
# 	echo "hash -d $1=\"`pwd`\"" >> ~/.zshmarks && source ~/.zshmarks
# }

# # Better bookmarks with jump
# source `jump-bin --zsh-integration`
# 
# # Jump aliases
# alias b='jump'
# alias ba='jump --add'
# alias bd='jump --del'
# alias bl='jump --list'

# Autoadd jump bookmarks to hash
load_zshmarks() {
	zshmarks=$(egrep -o "[^:]+\:[[:space:]]*.+" $HOME/.zshmarks)
	echo $zshmarks | while read zmark
	do
		# sed s/([^:]+)\:[[:space:]]*.+/\1/'
		name=$(echo $zmark | egrep -o '^[^:]+')

		# Expand directory path
		directory=$(echo $zmark | egrep -o '([^: ])+$')
		eval directory=$directory

		eval "hash -d $name=\"$directory\""
	done
}

function b() {
	# Use ZSH to expand current path with hash table
	echo "$1: `print -P %~`" >> ~/.zshmarks && load_zshmarks
}

load_zshmarks

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Source EC2 config if it exists
if [[ -s $HOME/.ec2/aws ]] then
	source $HOME/.ec2/aws
fi
