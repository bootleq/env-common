#!/bin/zsh

echo -n "Deploy all files to working place? (y/n) "
read sure
if [[ $sure != "y" ]]; then
  echo "Aborded."
fi

files=('SYSTEM_VIMRC' 'SYSTEM_ZSHRC' 'GVIMRC' 'GITCONFIG')
checked=()

if [[ -x ./paths.zsh ]]; then
  source ./paths.zsh
  for file in $files; do
    if [[ -z ${(P)file} ]]; then
      echo -n "Path undefined: $file. Skip and continue? (y/n) "
      read sure
      if [[ $sure == "y" ]]; then
        unset $file
      else
        echo "Aborded."
        exit 1
      fi
    else
      checked+=($file)
    fi
  done
else
  echo "Error: paths.zsh not executable."
  exit 1
fi

if [[ -n $USER_VIM_DIR ]]; then
  rsync -av `pwd`/home_vim/ $USER_VIM_DIR
else
  echo -n "Path undefined: USER_VIM_DIR. Skip and continue? (y/n) "
  read sure
  if [[ $sure != "y" ]]; then
    echo "Aborded."
    exit 1
  fi
fi

[[ -n $GITCONFIG ]]    && cp -v     `pwd`/.gitconfig $GITCONFIG
[[ -n $SYSTEM_VIMRC ]] && cp -v     `pwd`/system_rc/vimrc $SYSTEM_VIMRC
[[ -n $SYSTEM_ZSHRC ]] && cp -v     `pwd`/system_rc/zshrc $SYSTEM_ZSHRC
[[ -n $GVIMRC ]]       && cp -v     `pwd`/gvim/vimrc "$GVIMRC"
