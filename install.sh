#!/bin/bash

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return # `exit 1` would quit the shell itself
fi

if [ $DOTFILES_DIR == "." ]; then
    DOTFILES_DIR=$(PWD)
fi

echo "dotfiles directory: " $DOTFILES_DIR

# go code completion using youcompleteme
# install CMake and execute below command
# cd vim/bundle/youcompleteme, hit ENTER
#./install.py --gocode-completer

# Fetch vundle a vim plugin manager
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    echo "Install vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else 
    echo "Vundle already installed"
fi

# load system
for DOTFILE in "$DOTFILES_DIR"/system.{alias,env,function,path,prompt}; 
do
     [ -f "$DOTFILE" ] && . "$DOTFILE"
done

#sym link
echo "Creating symlink for .vimrc"
ln -sfv $DOTFILES_DIR/vim/.vimrc ~

echo "Creating symlink for .tmux.conf"
ln -sfv $DOTFILES_DIR/tmux/.tmux.conf ~

# Install all the plugins
echo "Install VIM plugins"
vim +PluginInstall +qall

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"
    ./install-osx.sh
fi

echo "vim/bundle/youcompleteme/install.py --gocode-completer"
~/.vim/bundle/youcompleteme/install.py --gocode-completer