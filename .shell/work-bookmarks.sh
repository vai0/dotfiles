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
alias lhel="kcadm-login && kcadm update realms/memsql -s verifyEmail=false"
alias rkct="./deploy/kube/util/reload-keycloak-img.sh && ./deploy/kube/util/reset-postgres.sh"
alias nukehelios="hel && dsp && dip && rm -rf singlestore.com/helios/bin && make kube-init"
alias login-ecr="cd ~/projects/aws-ci-runners && make login-registry && cd -"
alias testbackendmonitoring="PACKAGE=singlestore.com/helios/graph/cluster_tests/s2monitoring GO_TEST_VERBOSE='-run TestEndToEnd' make backend-cluster-test"
alias testmonitoringalerts="BACKEND_TEST=monitoringalerts make backend-integration-test"
alias testprivate="BACKEND_TEST=graph/server/private make backend-integration-test"

# Prep projects for a diff
alias pbf="bf && make lint-fix && make lint && make test"
alias lintfe="hel && make frontend-prettier-full-check && make frontend-lint-fix && make frontend-lint && make frontend-tsc"
alias pstudio="studio && cd frontend && npm run prettier && npm run lint && npm run tsc && npm run test"

# Other
alias bastion="ssh bastion-1b"
alias p2="pyenv global 2.7.17"
alias p3="pyenv global 3.6.3"
alias fl="flameshot gui"

alias settoken_prd="singlestore-auth-helper --baseURL https://portal.singlestore.com/admin/admin-sso --env-name=TOKEN && export TOKEN"
alias e2e-email-off='hel && kcadm-login && kcadm update realms/memsql -s verifyEmail=false'

function keepheaders() {
  keyword=$1  # Keyword to grep for

  # Read the complete input from stdin into the variable 'input'
  input=$(cat)

  # Extract the header (assuming it starts with NAME)
  header=$(echo "$input" | grep "^NAME")

  # Extract the lines containing the keyword
  lines=$(echo "$input" | grep "$keyword")

  # Print them together
  echo -e "$header\n$lines"
}

# Install memsql cluster-in-a-box
export SINGLESTORE_LICENSE=BGM5MjQwZGE3Nzg0MTRiMDk5NWNlNzAwOTQ4MTQwZWZjAAAAAAAAAAAAAAIAAAAAAAQwNgIZAJd6ds/wagCQvs1asVWyN40v0LVlYTs6CwIZAMff+F4bKAPsYRY8HW2h/6n5O6DjikyYAg==
export ROOT_PASSWORD="d"
alias ciab="docker rm -f singlestore-ciab || true && \
    docker run -i --init \
    --name singlestore-ciab \
    -e LICENSE_KEY=$SINGLESTORE_LICENSE \
    -e ROOT_PASSWORD=$ROOT_PASSWORD \
    -p 3306:3306 \
    singlestore/cluster-in-a-box && \
    docker start singlestore-ciab"

