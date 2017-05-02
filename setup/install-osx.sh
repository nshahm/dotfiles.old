#!/bin/bash
#Installing ruby
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null

# Installing packages
packages="./setup/packages"

while IFS=',' read -r aptget_package osx_brew
do 
  echo "Installing $osx_brew"
  brew install ${osx_brew}
done < "$packages"
