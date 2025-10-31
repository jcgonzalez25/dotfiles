#!/bin/bash
# Common system aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# List files and directories
alias ls='ls --color=auto'
alias ll='ls -lAh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lAhtr'  # Sort by date, most recent last
alias lsize='ls -lAhS'  # Sort by size

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# File operations - safer defaults
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ln='ln -iv'

# Human readable sizes
alias df='df -h'
alias du='du -h'
alias du1='du -h -d 1'  # One level deep
alias dus='du -sh'  # Summary

# Create parent directories as needed
alias mkdir='mkdir -pv'

# Quick directory listing after cd
cd() { builtin cd "$@" && ls; }

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias topcpu='ps aux --sort=-%cpu | head -n 10'
alias topmem='ps aux --sort=-%mem | head -n 10'

# Network
alias ports='netstat -tulanp'
alias listening='lsof -i -P | grep LISTEN'
alias myip='curl -s ifconfig.me && echo'
alias localip="ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print \$2}' | cut -d/ -f1"

# Find files and directories
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# Disk usage
alias diskspace='du -S | sort -n -r | less'
alias folders='find . -maxdepth 1 -type d -print | xargs du -sh | sort -hr'

# History
alias h='history'
alias hg='history | grep'

# System updates (Ubuntu/Debian)
alias update='sudo apt update'
alias upgrade='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'

# Utilities
alias cls='clear'
alias c='clear'
alias reload='source ~/.bashrc'
alias week='date +%V'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Quick edits
alias bashrc='${EDITOR:-nano} ~/.bashrc'
alias aliases='${EDITOR:-nano} ~/dotfiles/aliases/'

# Extract archives
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Make and change into directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}
