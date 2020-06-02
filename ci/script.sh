#!/usr/bin/env bash
set -e
set -o pipefail

build_fcitx5()
{
    echo "Build $1"
    cd "$1"
    mkdir build
    cd build
    cmake $2 ..
    make
    sudo make install
    cd ../../
}

install_cldr_emoji-annotation()
{
    cd cldr-emoji-annotation
    ./autogen.sh
    ./configure
    make
    sudo make install
    cd ../
}

install_cldr_emoji-annotation
build_fcitx5 "fmt"
build_fcitx5 "xcb-imdkit"
build_fcitx5 "fcitx5" "-DENABLE_WAYLAND=Off"
build_fcitx5 "fcitx5-gtk"
build_fcitx5 "fcitx5-qt"
build_fcitx5 "fcitx5-chinese-addons"
