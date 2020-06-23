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

# Docs commands
alias fdocs='docs && ./scripts/local/watch-frontend-linux.sh'
alias hdocs='docs && ./scripts/local/watch-hugo-linux.sh'

# Helios commands
alias initld="hel && make init-local-dev"
alias startld="hel && make start-local-dev"
alias stopld="hel && make stop-local-dev"
alias startf="hel && make frontend-start"

# Prep projects for a diff
alias pbf="bf && make lint-fix && make lint && make test"
alias phel="hel && make frontend-prettier && make frontend-lint-fix && make frontend-lint && make frontend-tsc && make frontend-test"
alias pstudio="studio && cd frontend && npm run prettier && npm run lint && npm run tsc && npm run test"

alias newpackage="bf && cd frontend && rm -rf node_modules package-lock.json"
alias ad="arc diff"
