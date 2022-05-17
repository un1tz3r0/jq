#!/bin/bash

set -e
set -v

sudo apt install -y flex bison libtool make automake autoconf

git submodule update --init # if building from git to get oniguruma
autoreconf -fi              # if building from git
./configure --with-oniguruma=builtin
make -j8
make check

sudo make install

