#!/bin/bash
# Git aliases

# Basic shortcuts
alias g='git'
alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'

# Commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'

# Branches
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcm='git checkout main || git checkout master'

# Diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'

# Logs
alias gl='git log --oneline --graph --decorate -20'
alias gla='git log --oneline --graph --decorate --all -20'
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit -20'
alias gloga='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all -20'

# Pull/Push
alias gp='git push'
alias gpu='git push -u origin'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gplr='git pull --rebase'

# Fetch/Merge
alias gf='git fetch'
alias gfa='git fetch --all'
alias gm='git merge'
alias gma='git merge --abort'

# Stash
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gsta='git stash apply'

# Reset
alias grh='git reset HEAD'
alias grhh='git reset --hard HEAD'
alias gundo='git reset --soft HEAD~1'

# Other
alias gclean='git clean -fd'
alias gcp='git cherry-pick'
alias gshow='git show'

# Useful git functions
gclone() {
    git clone "$1" && cd "$(basename "$1" .git)"
}

# Show changed files in last commit
gfiles() {
    git diff --name-only HEAD~1 HEAD
}

# Quick commit all changes
gcam() {
    git add --all && git commit -m "$1"
}

# Create new branch and switch to it
gnb() {
    git checkout -b "$1"
}

# Delete merged branches
gcleanup() {
    git branch --merged | grep -v "\*" | grep -v "main" | grep -v "master" | xargs -n 1 git branch -d
}
