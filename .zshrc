# export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$HOME/Library/Haskell/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH:$HOME/software/bin"
set -o vi

source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster
export DEFAULT_USER=marnold

# Tell antigen that you're done.
antigen apply

# User configuration
# completions
fpath=(/usr/local/share/zsh-completions $fpath)

source ~/.aliases
source ~/.env
source ~/.secrets

source "/usr/local/opt/nvm/nvm.sh"
