export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="igorsilva"
plugins=(git kubectl z)
source $ZSH/oh-my-zsh.sh

# Added by Nix installer
if [ -e ${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ${HOME}/.nix-profile/etc/profile.d/nix.sh; fi

# fnm
FNM_PATH="/home/jchi/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Source aliases
source ~/.dotfiles/.shell/aliases.sh

# Source bootstrap
source ~/.dotfiles/.shell/bootstrap.sh

# Source work-related bookmarks
source ~/.dotfiles/.shell/work-bookmarks.sh

# Source kubectl auto-completion
source <(kubectl completion zsh)

# Activate direnv
# eval "$(direnv hook $SHELL)"
eval "$(direnv hook zsh)"

# fnm
export PATH=/home/jchi/.fnm:$PATH
eval "`fnm env`"

autoload bashcompinit
bashcompinit
# source /home/jchi/projects/vcpkg/scripts/vcpkg_completion.zsh

[[ -s "/home/jchi/.gvm/scripts/gvm" ]] && source "/home/jchi/.gvm/scripts/gvm"

# Load pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# Poetry (python dep manager) is installed in /.local/bin
export PATH="/home/jchi/.local/bin:$PATH"

