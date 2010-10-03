#!/bin/zsh

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

for file in $checked; do
  if ! [[ -a ${(P)checked} ]]; then
    echo "Can't find file: $checked. \nAborded."
    exit 1
  fi
done

# USER-specific vim files (plugins, syntax, etc. See rsync-include)
if [[ -n $USER_VIM_DIR ]]; then
  rsync -av --include-from=rsync-include $USER_VIM_DIR `pwd`/home_vim
else
  echo -n "Path undefined: USER_VIM_DIR. Skip and continue? (y/n) "
  read sure
  if [[ $sure != "y" ]]; then
    echo "Aborded."
    exit 1
  fi
fi

# system git config
[[ -n $GITCONFIG ]] && cp -v $GITCONFIG `pwd`/.gitconfig

# system .vimrc & .zshrc
[[ -n $SYSTEM_VIMRC ]] && cp -v $SYSTEM_VIMRC `pwd`/system_rc/vimrc
[[ -n $SYSTEM_ZSHRC ]] && cp -v $SYSTEM_ZSHRC `pwd`/system_rc/zshrc

# gVim .vimrc
[[ -n $GVIMRC ]] && cp -v "$GVIMRC" `pwd`/gvim/vimrc
