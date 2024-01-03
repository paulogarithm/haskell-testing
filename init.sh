#!/bin/bash

# Get the tests directory
__here=$(dirname "$0")


# Install cabal & ghc
__packagemanager=$(which apt || which dnf || which brew)
sudo $__packagemanager install ghc

# Update & Move test in your own test stuff
cabal update
mv "$__here" "foo_$__here"
__here=$(dirname "$0")
mv "$__here/tests" "$__here/.."

# Remove this folder
rm -rf "$__here"

