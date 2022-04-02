export PATH=$HOME/bin:/usr/local/bin:$PATH

# * ---------- oh-my-zsh --------- *
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="igorsilva"
plugins=(git)

source $ZSH/oh-my-zsh.sh
# * ---------- oh-my-zsh --------- *


# * ----------    fzf    --------- *
# init 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# extended regex matchers
export FZF_DEFAULT_OPS="--extended"

# use ripgrep as the file-searcher with sensible defaults
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file ~/.ignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# * ----------    fzf    --------- *


# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"


# pyenv
eval "$(pyenv init --path)"


# z (file-jumper) https://github.com/rupa/z
export _Z_CMD="j" # remap default "z" cmd to "j"
. ~/z.sh


# * ---------- ALIASES --------- *
alias v='nvim'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Git aliases
alias gilo='git log --oneline --graph'
alias gil='git log --graph --abbrev-commit --stat -C --decorate --date=local'
alias gils="git log --graph --abbrev-commit --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)' -C --decorate --date=local"
alias gis='git status'
alias gid='git diff -C --date=local'
alias giw='git show -C --date=local --decorate'
alias gic='git checkout'
alias gib='git branch'
alias gicm='git commit -m'
alias gicc='git commit -am "CHECKPOINT"'

# Kill port
function kp() {
    fuser -k $1/tcp
}

# Kill and remove all containers
alias drm='docker rm -f $(docker container ls -aq)'
alias dsp='docker system prune -a --volumes'
# * ---------- ALIASES --------- *
