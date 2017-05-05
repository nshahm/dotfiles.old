#!/bin/bash

# Perform OS based install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"
    sh ./setup/osx.sh
elif [  -n "$(uname -a | grep Ubuntu)" ]; then
    echo -d "\n\n Running on Ubuntu"
    sudo ./setup/ubuntu.sh
fi

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

# Fetch tmux plugin manager
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    echo "Install Tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else 
    echo "Tmux plugin manager already installed"
fi

# load system
for DOTFILE in "$DOTFILES_DIR"/system/.{alias,env,function,path,prompt}; 
do
     echo $DOTFILE
     [ -f "$DOTFILE" ] && . "$DOTFILE"
done

#sym link
echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES_DIR" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

# Install all the plugins
echo "Install VIM plugins"
vim +PluginInstall +qall

# install antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh

echo "vim/bundle/youcompleteme/install.py --gocode-completer"
# ~/.vim/bundle/youcompleteme/install.py --gocode-completer
