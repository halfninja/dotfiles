#!/bin/bash

FILENAME=puppetlabs-release-unstable.deb

function die() {
  echo "Wuff! WUFF!!"
  exit 1
}

pushd ~/Downloads
echo "Downloading $FILENAME"
wget http://apt.puppetlabs.com/$FILENAME || die
echo "Installing..."
sudo dpkg -i $FILENAME || die
echo "Updating apt..."
sudo apt-get update || die
echo "Installing puppet package..."
sudo apt-get install puppet || die
echo "Yay!"

echo "Welcome to Puppet $(puppet --version), you nerd."

