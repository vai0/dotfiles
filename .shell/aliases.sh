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

# Bookmarks
alias proj='cd ~/projects'
alias docs='cd ~/projects/docs'
alias studio='cd ~/projects/memsql/go/src/platform/studio'
alias bf='cd ~/projects/bifrost'
alias elq='cd ~/projects/eloqua'
alias blog='cd ~/projects/blog'
alias freya='cd ~/projects/freya'

# Bifrost commands
alias rbf='bf && make start-frontend'
alias bbf='bf && make build-frontend'
alias sbf="bf && make server"

# Docs commands
alias fdocs='docs && ./scripts/local/watch-frontend-linux.sh'
alias hdocs='docs && ./scripts/local/watch-hugo-linux.sh'

# Freya commands
alias initld="freya && make init-local-dev"
alias startld="freya && make start-local-dev"
alias stopld="freya && make stop-local-dev"
alias startf="freya && make frontend-start"

# Prep projects for a diff
alias pbf="bf && make lint-fix && make lint && make test"
alias pfreya="freya && make frontend-prettier && make frontend-lint-fix && make frontend-lint && make frontend-tsc && make frontend-test"
alias pstudio="studio && cd frontend && npm run prettier && npm run lint && npm run tsc && npm run test"

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
alias newpackage="bf && cd frontend && rm -rf node_modules package-lock.json"
alias ad="arc diff"


# Learnings
export LEARNS_PATH="~/Documents/learnings"
alias learns="code ${LEARNS_PATH}/stuff-ive-learned.md"
alias learns-commit="cd ${LEARNS_PATH} && gicc"
alias learns-push="cd ${LEARNS_PATH} && git push"
alias learns-pull="cd ${LEARNS_PATH} && git pull"

# Notes
export NOTES_PATH="~/Documents/notes"
alias notes="code ${NOTES_PATH}/notes.md"
alias notes-commit="cd ${NOTES_PATH} && gicc"
alias notes-push="cd ${NOTES_PATH} && git push"
alias notes-pull="cd ${NOTES_PATH} && git pull"

# Sandboxes
alias jss="code ~/Documents/sandbox.js"
alias pys="code ~/Documents/sandbox.py"
alias mds="code ~/Documents/sandbox.md"

# refresh aws sts profile access tokens for s3 usage
export GOOGLE_USERNAME=jchi@memsql.com
export GOOGLE_SP_ID=169398039274
export GOOGLE_IDP_ID=C01aaho54
alias refresh-aws-tokens-memsql-team="npx gsts --force --clean --verbose --aws-role-arn 'arn:aws:iam::798487538782:role/StandardUser'"
alias refresh-aws-tokens-memsql-team-e="npx gsts --force --clean --verbose --aws-role-arn 'arn:aws:iam::651246146166:role/StandardUser'"
# Old alias using aws-google-auth
# alias refresh-aws-tokens="aws-google-auth --print-creds --resolve-aliases -a -I ${GOOGLE_IDP_ID} -S ${GOOGLE_SP_ID} -R us-east-1 -d 3600 -u ${USER}@memsql.com"
