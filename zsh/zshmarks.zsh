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
