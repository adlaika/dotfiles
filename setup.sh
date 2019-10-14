#!/bin/sh

# get absolute path of script, regardless caller path
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install stuff
brew cask install lastpass intellij-idea visual-studio-code 
brew install zsh git antigen nvm awscli haskell-stack rbenv

# create empty .secrets file if it hasn't already been made
touch "$script_path/.secrets"

# symlink dotfiles and plists into home dir
files=$(ls -a | grep "^\.[a-z]" | grep -v "^\.git")
files+=" $(ls -a | grep *plist*)"

for file in $files
do
	file_origin="$script_path/$file"
	file_symlink="$HOME/$file"
	echo "symlinking $file_symlink to $file_origin"
	ln -sf $file_origin $file_symlink
done

# change default shell to zsh
chsh -s `which zsh`