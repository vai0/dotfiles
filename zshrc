export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="igorsilva"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Added by Nix installer
if [ -e ${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ${HOME}/.nix-profile/etc/profile.d/nix.sh; fi


# fnm
export PATH=/home/jchi/.fnm:$PATH
eval "`fnm env`"

# snap package managener (for spotify... spotify's deb package is out of date)
export PATH="$PATH:/snap/bin"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Init z (https://github.com/rupa/z)
. ~/z.sh

# Source aliases
source ~/.dotfiles/.shell/aliases.sh

# Source bootstrap
source ~/.dotfiles/.shell/bootstrap.sh

# Source secrets
source ~/.dotfiles/.shell/secrets.sh

# Source work-related bookmarks
source ~/.dotfiles/.shell/work-bookmarks.sh

# Activate direnv
eval "$(direnv hook $SHELL)"
