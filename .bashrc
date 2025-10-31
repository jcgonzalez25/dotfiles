#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Shell options
shopt -s histappend        # Append to history, don't overwrite
shopt -s checkwinsize      # Check window size after each command
shopt -s cdspell           # Autocorrect typos in path names when using cd
shopt -s nocaseglob        # Case-insensitive globbing
shopt -s dotglob           # Include dotfiles in pathname expansion

# History configuration
HISTCONTROL=ignoreboth:erasedups  # No duplicate entries
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%F %T "

# Eternal bash history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy colored prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # Color support
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    # No color
    PS1='\u@\h:\w\$ '
fi

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Source all alias files
DOTFILES_DIR="$HOME/dotfiles"

if [ -d "$DOTFILES_DIR/aliases" ]; then
    for alias_file in "$DOTFILES_DIR"/aliases/*.sh; do
        [ -r "$alias_file" ] && . "$alias_file"
    done
fi

# Source local customizations (if any)
[ -f ~/.bashrc.local ] && . ~/.bashrc.local

# Add local bin to PATH if it exists
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
