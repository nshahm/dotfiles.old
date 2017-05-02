# install apt-get package
sudo apt-get update && sudo apt-get upgrade 

# Installing packages
packages="./setup/packages"

while IFS=',' read -r aptget_package osx_brew
do 
  echo "Installing $aptget_package"
  apt-get install --force-yes --yes ${aptget_package}
done < "$packages"
