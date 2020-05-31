# Autojump
[[ -s /home/jchi/.autojump/etc/profile.d/autojump.sh ]] && source /home/jchi/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Set nix env variables
. ${HOME}/.nix-profile/etc/profile.d/nix.sh

# Added by Nix installer
if [ -e /home/jchi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jchi/.nix-profile/etc/profile.d/nix.sh; fi

# Activate direnv
eval "$(direnv hook zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

