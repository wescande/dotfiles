#!/bin/bash

set -e

git_url=https://git.suckless.org/st/
build_dir=tmp_st
rm -rf $build_dir
git clone $git_url $build_dir

cd $build_dir
for i in `find ../st/patch.d -name "git*"`
do
	git apply $i
done
for i in `find ../st/patch.d -name "*patch"`
do
	patch -p1 < $i
done
make
sudo make install
rm -rf $build_dir
