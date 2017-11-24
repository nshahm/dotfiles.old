

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
    echo "~${target#$HOME} already exists... recreating it to ensure it points to " $file
    rm -f $target
    ln -s $file $target
  else
    echo "Creating symlink for $file"
    ln -s $file $target
  fi
done

# Install node via nvm
echo -d "\n\n Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install required node plugins
echo -d "\n\n Installing node global packages"
sudo sh ./packages/node.sh


# Install neovim plugins
echo "Installing dein (Plugin Manager for neovim)"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > downloaded_installer.sh
sh ./downloaded_installer.sh ~/.vim

# Install all the plugins
echo "Install NEOVIM plugins"
vim +NeoBundleInstall +qall +UpdateRemotePlugins

# Creating symbolic link for nvmrc
mkdir -p ~/.config/nvim/

if [ -e "~/.vimrc" ]; then
  rm -f ~/.vimrc  
  rm -f ~/.nvimrc
fi
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.vimrc ~/.nvimrc

MYNVIMRC=~/.vimrc

if [ -e "~/.vim" ]; then
  rm -f ~/.vim
  ln -s ~/.vim ~/.nvim
fi

# Install tmux plugin manager
if [ ! -e ~/.tmux/plugins/tpm ]; then
  echo "Install tmux plugin manager."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux plugin manager already installed"
fi

if [ ! -e ~/.zplug ]; then
  echo "Installing zplug"
  export ZPLUG_HOME=~/.zplug
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
else
  echo "~/.zplug already exists... Skipping."
fi

#Adding Fonts to nvim devicons
echo "Adding DroidSansMono font for webdev icons.."
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

cp ./Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete.otf ~/Library/Fonts

echo "vim/bundle/youcompleteme/install.py --gocode-completer --tern-completer"
#~/.vim/bundle/youcompleteme/install.py --gocode-completer --tern-completer

# Call +UpdateRemotePlugins
nvim +UpdateRemotePlugins

