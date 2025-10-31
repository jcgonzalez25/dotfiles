#!/bin/bash
# Docker aliases

# Docker
alias d='docker'
alias dp='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dlog='docker logs'
alias dlogf='docker logs -f'
alias dstop='docker stop'
alias dstart='docker start'
alias drestart='docker restart'

# Docker Compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcps='docker-compose ps'
alias dcb='docker-compose build'
alias dce='docker-compose exec'

# Docker cleanup
alias dprune='docker system prune -af'
alias dvprune='docker volume prune -f'
alias dnprune='docker network prune -f'

# Docker functions
dsh() {
    docker exec -it "$1" /bin/bash
}

dshell() {
    docker exec -it "$1" /bin/sh
}

# Stop all containers
dstopall() {
    docker stop $(docker ps -q)
}

# Remove all stopped containers
drmall() {
    docker rm $(docker ps -aq)
}

# Remove all images
drmiall() {
    docker rmi $(docker images -q)
}

# Docker IP address
dip() {
    docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}
