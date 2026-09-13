#!/bin/sh
# $1 = path/file to select
# $2 = multiple files (1/0)
# $3 = directory mode (1/0)
# $4 = save mode (1/0)
# $5 = output path file

out="$5"
echo "" > "$out"

kitty --class yazi-chooser -e yazi "$1" --chooser-file="$out"
