#!/bin/fish
argparse d/dir -- $argv || exit

if ! set -ql _flag_dir
or test "$argv[1]" = ""
    echo "slike spremeni v jpg format"
    echo ""
    echo "./process_images.fish <dir>"
    echo ""
    echo "dir: absolute path do slik relativno glede na root"
    exit
end

set compression_quality 31
set dir $argv[1]

pushd $dir || exit

set target "compressed_"{$compression_quality}
mkdir $target || exit

for f in *.jpg
    set out "$target/$f"
    ffmpeg -i $f -loglevel quiet -q:v $compression_quality $out
end

popd || exit
