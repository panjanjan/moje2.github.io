#!/bin/fish
if ! set -q $argv[2]
    echo "./insert_images.fish <dir>"
    echo ""
    echo "dir je absolute path do slik relativno glede na root"
    echo "slike morajo biti jpg"
    exit
end

for f in (find assets/images/ch1/ -type f | sort)
      set n (path basename $f | string replace ".jpg" "")
      echo "<img src=\"$f\" alt=\"ch 1 p $n\">" >> ch1.html
end
