#!/bin/bash
#
# This script provisions a new Mac with the most important
# config settings, tools, etc.

# Test if brew is installed
brew > /dev/null 2>&1
INSTALLED=$?
if [ $INSTALLED -eq 1 ]; then
    echo "Brew installed, moving on."
else
    echo "Brew not installed. Installing brew."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages via brew
brew update
# --> Tools
brew install git zsh tmux emacs docker aria2 htop curl most unzip tcpdump ag clean \
    grep awk
# --> Languages
brew install ruby go python python3
# --> Other libraries
brew install openssl

# Install XCode tools
xcode-select --install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install common python tools
# --> Powerline
pip install powerline-status
