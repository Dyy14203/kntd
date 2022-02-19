#!/bin/bash
cd ~/rom

. build/envsetup.sh
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=serber-memek
export TZ=Asia/Jakarta
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 100G -F 0
ccache -o compression=true
ccache -z
$lunch
$make -j8 &
sleep 103m
kill %1
ccache -s

