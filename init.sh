#!/bin/bash

# Get the tests directory
__basedir=$(dirname "$0")
__here="$PWD/$__basedir"

# Move/Remove useless stuff
mv "$__here/LICENSE" "$__here/README.md" tests
rm "$__here/.gitignore"

# Install cabal & ghc
__packagemanager=$(which apt || which dnf || which brew)
sudo $__packagemanager install ghc

# Update & Move test in your own test stuff
mv "$__here/.gitignore" "$__here/__tests"
mv "$__here/__tests" "$__here/.."
cabal update

# Remove this folder
rm -rf "$__here"

