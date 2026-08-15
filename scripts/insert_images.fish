#!/bin/fish
argparse d/dir f/file -- $argv || exit

if ! set -ql _flag_dir
or ! set -ql _flag_file
or test \( "$argv[1]" = "" -o "$argv[2]" = "" \)
    echo "Vstavi slike v HTML dokument. Slike morajo biti jpg. Pazi da ne poženeš večkrat."
    echo ""
    echo "Usage:"
    echo "  insert_images.fish <options>"
    echo ""
    echo "Options:"
    echo "  -d, --dir   absolute path do slik"
    echo "  -f, --file  absolute path do HTML dokumenta"
    exit
end

set dir $argv[1]
set file $argv[2]

for f in (find $dir/ -type f | sort)
      set n (path basename $f | string replace ".jpg" "")
      echo "<img src=\"$f\" alt=\"ch 1 p $n\">" >> "$file"
end

cat $file
