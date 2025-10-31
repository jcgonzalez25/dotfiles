#!/bin/bash
# Development aliases

# Python
alias py='python3'
alias python='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'
alias deactivate='deactivate'

# Node/npm/yarn
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'
alias nb='npm run build'
alias nrd='npm run dev'
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn run'
alias ys='yarn start'
alias yt='yarn test'
alias yb='yarn build'

# Server shortcuts
alias serve='python3 -m http.server'
alias serve8000='python3 -m http.server 8000'
alias phpserve='php -S localhost:8000'

# Code editors
alias code='code .'
alias subl='subl .'
alias vim='vim'
alias v='vim'

# File searching
alias findfile='find . -name'
alias findin='grep -rnw . -e'

# Count lines of code
alias countcode='find . -name "*.py" -o -name "*.js" -o -name "*.java" -o -name "*.go" | xargs wc -l'

# Database (if you use them)
alias pgstart='sudo service postgresql start'
alias pgstop='sudo service postgresql stop'
alias mystart='sudo service mysql start'
alias mystop='sudo service mysql stop'

# Quick localhost
alias lh='localhost'

# Generate random password
alias genpass='openssl rand -base64 32'

# JSON pretty print
alias json='python3 -m json.tool'

# URL encode/decode
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

# Functions

# Create React App
cra() {
    npx create-react-app "$1" && cd "$1"
}

# Create new Next.js app
nextapp() {
    npx create-next-app "$1" && cd "$1"
}

# Create new Vite project
viteapp() {
    npm create vite@latest "$1" && cd "$1"
}

# Kill process on port
killport() {
    lsof -ti:"$1" | xargs kill -9
}

# Show what's running on a port
onport() {
    lsof -i :"$1"
}
