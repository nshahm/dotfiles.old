export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install nodejs
echo "Installing nodejs"
echo "=================="
nvm install 8.4.0

#Install brew dependencies
packages=(
typescript
yarn
tslint
typescript-formatter
js-beautify
remark
stylefmt
tern
)

for package in "${packages[@]}"; do
  $(which npm) install --global $package
done
