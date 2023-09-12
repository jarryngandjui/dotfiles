
# Postgres
alias postgres='brew services start postgresql@15'

# Python alias
# Updates the python and pip aliases when using virtualenv 
alias python='eval $(which python3)'
alias pip='eval $(which pip3)'
alias activate='source ./venv/bin/activate'

# Alias edit
alias alias-edit='vi ~/.aliases'

# Aws Credentials
alias aws-credentials='vi ~/.aws/credentials'

# Application
# todo.txt-cli (https://github.com/todotxt/todo.txt-cli)
#alias t=todo.sh

# Git Commands
# -----------------------------
# git add -u : updates existing files that are tracked and does not add new ones
alias gat="ga -u"

# Delete a local branch
function gbdl() {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="(unnamed branch)"     # detached HEAD
  branch_name=${branch_name##refs/heads/}
    
  gcm
  gb -D "${branch_name}"
}

# Delete a remote branch
function gbdr() {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="(unnamed branch)"     # detached HEAD
  branch_name=${branch_name##refs/heads/}

  gcm
  gp origin --delete "${branch_name}"
}

# Delete a local and remote branch
function gbdrl() {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="(unnamed branch)"     # detached HEAD
  branch_name=${branch_name##refs/heads/}

  gcm
  gp origin --delete "${branch_name}"
  gb -D "${branch_name}"
}
