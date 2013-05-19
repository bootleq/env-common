#!/bin/bash


# 安裝相依套件
apt-get install mercurial
apt-get install exuberant-ctags


# 取得 vim source
cd /usr/local/src
hg clone https://vim.googlecode.com/hg/ vim
cd vim
hg pull
hg update

# checkout 特定版本
# hg checkout v7-3-476


# make & install
cd src
# make distclean

# 修改 ruby lib 路徑
# export LDFLAGS="-L/opt/ruby/lib -lruby-static"
# ./configure --with-features=big --enable-rubyinterp

make
make install
