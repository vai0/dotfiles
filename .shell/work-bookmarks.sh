alias wb="vim /home/jchi/.dotfiles/.shell/work-bookmarks.sh"

# Bookmarks
alias proj='cd ~/projects'
alias docs='cd ~/projects/docs'
alias studio='cd ~/projects/memsql/go/src/platform/studio'
alias bf='cd ~/projects/bifrost'
alias elq='cd ~/projects/eloqua'
alias blog='cd ~/projects/blog'
alias hel='cd ~/projects/helios'

# Bifrost commands
alias rbf='bf && make start-frontend'
alias bbf='bf && make build-frontend'
alias sbf="bf && make server"

# Helios commands
alias rhel="make frontend-start"
alias dlhelf="pyenv global 3.6.3 && python scripts/deploy-log frontend"
alias dlhelb="pyenv global 3.6.3 && python scripts/deploy-log backend"
alias bhel="make frontend-build-dev"
alias shel="pyenv global 2.7.17 && make frontend-serve-dev"
alias lhel="kcadm-login && kcadm update realms/memsql -s verifyEmail=false"
alias rkct="./deploy/kube/util/reload-keycloak-img.sh && ./deploy/kube/util/reset-postgres.sh"

# Prep projects for a diff
alias pbf="bf && make lint-fix && make lint && make test"
alias phel="hel && make frontend-prettier && make frontend-lint-fix && make frontend-lint && make frontend-tsc && make frontend-test"
alias pstudio="studio && cd frontend && npm run prettier && npm run lint && npm run tsc && npm run test"

# Other
alias ad="arc diff"
alias al="arc land"
alias p2="pyenv global 2.7.17"
alias p3="pyenv global 3.6.3"

# Install memsql cluster-in-a-box
export LICENSE_KEY=BGM5MjQwZGE3Nzg0MTRiMDk5NWNlNzAwOTQ4MTQwZWZjAAAAAAAAAAAAAAIAAAAAAAQwNgIZAJd6ds/wagCQvs1asVWyN40v0LVlYTs6CwIZAMff+F4bKAPsYRY8HW2h/6n5O6DjikyYAg==
export ROOT_PASSWORD="d"
alias ciab="docker rm -f singlestore-ciab || true && \
    docker run -i --init \
    --name singlestore-ciab \
    -e LICENSE_KEY=$LICENSE_KEY \
    -e ROOT_PASSWORD=$ROOT_PASSWORD \
    -p 3306:3306 -p 8080:8080 \
    singlestore/cluster-in-a-box && \
    docker start singlestore-ciab"

