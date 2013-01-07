for file in ./*
do
	if [[ -s $file ]] ; then
		echo ""
	else
		echo "Dumping $file"
		cat "$file/..namedfork/rsrc" > "$file"
	fi
done
