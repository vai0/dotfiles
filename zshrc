export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="igorsilva"
plugins=(git)

source $ZSH/oh-my-zsh.sh


# Set nix env variables
. ${HOME}/.nix-profile/etc/profile.d/nix.sh

# Added by Nix installer
if [ -e /home/jchi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jchi/.nix-profile/etc/profile.d/nix.sh; fi

# Activate direnv
eval "$(direnv hook zsh)"

# fnm
export PATH=/home/jchi/.fnm:$PATH
eval "`fnm env --multi`"

# Source aliases
source ~/.dotfiles/.shell/aliases.sh

# Source bootstrap
source ~/.dotfiles/.shell/bootstrap.sh

# Source secrets
source ~/.dotfiles/.shell/secrets.sh

# Source work-related bookmarks
source ~/.dotfiles/.shell/work-bookmarks.sh

