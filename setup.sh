#!/bin/bash
# This sets everything up on a fresh install
# Destroys everything you once had.
dir="$(dirname "$(realpath "$0")")"
modifications=(".Xmodmap" ".Xdefaults" ".pythonrc" ".bashrc" ".config" ".vimrc" ".inputrc" )

for mod in "${modifications[@]}"
do
	if [ -e ~/$mod ] || [ -L ~/$mod ] || [ -d ~/$mod ]
	then
		rm ~/$mod -r
	fi

	ln -s $dir/$mod ~/$mod
done
