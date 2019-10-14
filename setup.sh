#!/bin/sh

brew cask install lastpass intellij-idea visual-studio-code 
brew install zsh git antigen nvm awscli haskell-stack rbenv

script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

files=$(ls -a | grep "^\.[a-z]" | grep -v "^\.git")
files+=" $(ls -a | grep *plist*)"

for file in $files
do
	file_origin="$script_path/$file"
	file_symlink="$HOME/$file"
	echo "symlinking $file_symlink to $file_origin"
	ln -sf $file_origin $file_symlink
done
