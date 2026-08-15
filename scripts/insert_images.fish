#!/bin/fish
argparse d/dir f/file -- $argv || exit

if ! set -ql _flag_dir
or ! set -ql _flag_file
or test \( "$argv[1]" = "" -o "$argv[2]" = "" \)
    echo ""
    echo "./insert_images.fish <dir> <file>"
    echo ""
    echo "vstavi slike v HTML dokument. slike morajo biti jpg."
    echo "pazi da ne poženeš večkrat."
    echo ""
    echo "dir:  absolute path do slik"
    echo "file: absolute path do HTML dokumenta"
    exit
end

set dir $argv[1]
set file $argv[2]

for f in (find $dir/ -type f | sort)
      set n (path basename $f | string replace ".jpg" "")
      echo "<img src=\"$f\" alt=\"ch 1 p $n\">" >> "$file"
end

cat $file
