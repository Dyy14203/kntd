#!/bin/bash
cd /tmp/rom

export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=serber-memek
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 100G -F 0
ccache -o compression=true
ccache -z
. build/envsetup.sh
lunch lineage_juice-userdebug
mka bacon -j8 &
sleep 100m
kill %1
ccache -s
