#!/bin/bash

# 安裝相依套件 (libevent 2.0)
# http://www.monkey.org/~provos/libevent/
apt-get install libevent-dev

# 取得 source
cd /usr/local/src
git clone git://git.code.sf.net/p/tmux/tmux-code tmux-tmux-code
cd tmux-tmux-code
git fetch

# checkout 特定版本
git checkout --no-track --quiet 1.8


sh autogen.sh
./configure && make
make install
