# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

CASE_SENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git git-flow scala brew osx vagrant docker docker-compose kubectl)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH:~/.my-mac-config/bin


setopt PUSHDSILENT

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

####################
# Aliases
####################
alias unstage='git reset HEAD'
alias g='git'
alias gff='git flow feature'
alias ll='ls -lG'
alias hlog='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias gw='./gradlew'
alias zshrc='. ~/.zshrc'
alias k='kubectl'

# Docker stuff

function docker-shell() {
    docker exec -i -t "$1" /bin/bash
}

function docker-cleanup() {
    docker ps -aq | xargs docker rm -vf
    docker network ls -qf type=custom | xargs docker network rm
}

# Mac-specific stuff

export JAVA_HOME=$(/usr/libexec/java_home)
alias readlink='greadlink'
alias makesafe='sudo xattr -d -r com.apple.quarantine'
