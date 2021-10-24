# Alias edit
alias alias-edit='vi ~/.aliases'

# Aws Credentials
alias aws-credentials='vi ~/.aws/credentials'

# Application
# todo.txt-cli (https://github.com/todotxt/todo.txt-cli)
alias t=todo.sh

# Servers
# BeanTown Café
alias jarry@btc_react='ssh -i ~/Moi/Git/.pem/caffe-library.pem jarry@100.25.117.241'
alias jarry@btc_node='ssh -i ~/Moi/Git/.pem/caffe-library.pem jarry@54.90.37.246'
alias ubuntu@btc_react='ssh -i ~/Moi/Git/.pem/caffe-library.pem ubuntu@100.25.117.241'
alias ubuntu@btc_node='ssh -i ~/Moi/Git/.pem/caffe-library.pem ubuntu@54.90.37.246'

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


# Financial Commands
# -----------------------------
# python3 /Users/jarry/Git/Notes/Financial\ Review/runner.py
alias tc="python3 /Users/jarry/Git/Notes/Financial\ Review/runner.py" 