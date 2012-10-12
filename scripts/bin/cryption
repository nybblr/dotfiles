#!/bin/bash
# cryption.sh: command line for quick encryption/decryption
usage() {
	echo "Usage: $0 filename (-e|-d)"
	exit 1
}

is_file_exits() {
	local f="$1"
	[[ -f "$f" ]] && return 0 || return 1
}

[[ $# -eq 0 ]] && usage

FILE=$2
EXT=enc
MODE=e

# Check -d argument
while getopts "ed" opt
do
	case $opt in
		e)
			echo "I found a -e!" >&2
			;;
		d)
			echo "I found a -d!" >&2
			EXT=dec
			MODE=d
			;;
		\?)
			echo "Invalid option!"
			;;
	esac
done

OUT=$FILE.$EXT

if ( is_file_exits "$FILE" )
then
	echo "${EXT}rypting $1..."

	openssl enc -$MODE -aes-256-cbc -salt -in $FILE -out $OUT
else
	"File not found!"
fi


