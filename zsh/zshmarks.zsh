# Autoadd jump bookmarks to hash
load_zshmarks() {
  source $HOME/.zshmarks
}

function b() {
	# Use ZSH to expand current path with hash table
	echo "hash -d $1=`print -P %~`" >> ~/.zshmarks && load_zshmarks
}

load_zshmarks
