# Increase hold down key rate
xset r rate 200 50

# Autojump
[[ -s /home/jchi/.autojump/etc/profile.d/autojump.sh ]] && source /home/jchi/.autojump/etc/profile.d/autojump.sh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

