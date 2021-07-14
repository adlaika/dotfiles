#!/bin/sh

# get absolute path of script, regardless of caller path
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install brew if not already
brew --version > /dev/null
if [[ $? -eq 1 ]]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# enable brew cask
brew tap homebrew/cask-versions

# update and upgrade software on subsequent runs of this script
brew update
brew upgrade
brew upgrade --cask

# install stuff
brew cask install java lastpass intellij-idea visual-studio-code iterm2 google-chrome firefox 
brew install zsh git antigen nvm awscli haskell-stack rbenv postgres scala bash coreutils maven node tree wget graphviz openssl python@2 vim watch bash-completion jq yarn

# start services and add to startup
brew services start postgresql

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

# change default shell to zsh if not already
DEFAULT_SHELL=$(dscl . -read ~/ UserShell | sed 's/UserShell: //')
if [[ "$DEFAULT_SHELL" != *"/zsh" ]]; then
	ZSH_LOCATION=$(which zsh)
	grep -qF "$ZSH_LOCATION" /etc/shells  || echo "$ZSH_LOCATION" | sudo tee -a /etc/shells
	# sudo echo "$(which zsh)" >> /etc/shells
	chsh -s "$ZSH_LOCATION"
fi

# install ghcup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh