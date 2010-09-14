#!/bin/sh

echo -n "Deploy all files to working place? (y/n) "
read sure
if [[ $sure == "y" ]]; then
  rsync -av `pwd`/home_vim/ $HOME/.vim
  cp -v     `pwd`/system_rc/vimrc /usr/local/share/vim/vimrc
  cp -v     `pwd`/system_rc/zshrc /etc/zshrc
else
  echo "Aborded."
fi
