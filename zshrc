export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="igorsilva"
export NVM_LAZY_LOAD=true
plugins=(git zsh-nvm)

source $ZSH/oh-my-zsh.sh

# Source aliases
source ~/.dotfiles/.shell/aliases.sh

# Source bootstrap
source ~/.dotfiles/.shell/bootstrap.sh

# Source secretes
source ~/.dotfiles/.shell/secrets.sh

