#!/bin/sh

if test ! $(which brew); then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

#Install brew dependencies
formulas=(
# flags should pass through the the `brew list check`
#'vim --with-lua'
neovim/neovim/neovim
git
cask
reattach-to-user-namespace
tmux
tree
wget
zsh
go
openssl
curl
python3
# delve
)
for formula in "${formulas[@]}"; do
  if brew list "$formula" > /dev/null 2>&1; then
    echo "$formula already installed... skipping."
  else
    brew install $formula
  fi
done

# Install cask dependencies
cask_formulas=(
iterm2
)
for formula in "${cask_formulas[@]}"; do
  if brew list "$formula" > /dev/null 2>&1; then
    echo "$formula already installed... skipping."
  else
    brew cask install $formula
  fi
done

brew update
brew upgrade
brew cleanup

pip install neovim
pip3 install neovim
