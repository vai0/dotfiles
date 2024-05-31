export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="igorsilva"
plugins=(git kubectl)
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
# enable fzf keybindings and fuzzy auto-completion
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

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
