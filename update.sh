#!/bin/sh

# USER-specific vim files (plugins, syntax, etc. See rsync-include)
rsync -av --include-from=rsync-include $HOME/.vim/ `pwd`/home_vim

# SYSTEM .vimrc & .zshrc
cp -v /usr/local/share/vim/vimrc `pwd`/system_rc/vimrc
cp -v /etc/zshrc                 `pwd`/system_rc/zshrc
