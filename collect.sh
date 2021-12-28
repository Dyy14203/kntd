#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch nad_juice-userdebug
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
make nad -j$(nproc --all) &
sleep 95m
kill %1
ccache -s
