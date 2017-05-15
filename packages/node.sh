# Install nodejs
echo "Installing nodejs"
echo "=================="
nvm install 6.10.3

#Install brew dependencies
packages=(
   typescript
   yarn
   tslint
)

for package in "${packages[@]}"; do
    $(which npm) install --global $package
done
