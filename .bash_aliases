#!/bin/bash
# Common helpful aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# List files
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Confirm before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Human readable sizes
alias df='df -h'
alias du='du -h'

# Create parent directories as needed
alias mkdir='mkdir -pv'

# Quick edits
alias bashrc='${EDITOR:-nano} ~/.bashrc'
alias aliases='${EDITOR:-nano} ~/.bash_aliases'

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

# Network
alias ports='netstat -tulanp'
alias myip='curl -s ifconfig.me'

# System
alias update='sudo apt update && sudo apt upgrade'
alias cls='clear'
