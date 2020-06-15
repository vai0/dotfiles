alias v='vim'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

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

# Other commands
alias squ="google-chrome https://squoosh.app"
alias open="xdg-open ."
alias ports="lsof -i TCP:9000"
alias copy="xclip -selection c"
alias killchrome="killall chrome"
alias killcontainers='docker rm -f $(docker container ls -aq)'
alias killslack="kill -9 $(pidof slack)"
alias vimrc="cd ~/.dotfiles && v vimrc"
alias initvim="cd ~/.dotfiles && v init.vim"
alias aliases="cd ~/.dotfiles/.shell && v aliases.sh"
alias zshrc="cd ~/.dotfiles && v zshrc"
alias installdotfiles="cd ~/.dotfiles && ./install"

# Learnings
export LEARNS_PATH="~/Documents/learnings"
alias learns="code ${LEARNS_PATH}/stuff-ive-learned.md"
alias learns-commit="cd ${LEARNS_PATH} && gicc"
alias learns-push="cd ${LEARNS_PATH} && git push"
alias learns-pull="cd ${LEARNS_PATH} && git pull"

# Notes
export NOTES_PATH="~/Documents/notes"
alias notes="v ${NOTES_PATH}/notes.md"
alias notes-commit="cd ${NOTES_PATH} && gicc"
alias notes-push="cd ${NOTES_PATH} && git push"
alias notes-pull="cd ${NOTES_PATH} && git pull"

# Sandboxes
alias jss="code ~/Documents/sandbox.js"
alias pys="code ~/Documents/sandbox.py"
alias mds="code ~/Documents/sandbox.md"

