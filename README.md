# dotfiles

Personal dotfiles configuration

## Contents

- `.bash_aliases` - Common helpful command aliases

## Installation

Create a symbolic link from your home directory:

```bash
# Backup existing file (optional but recommended)
mv ~/.bash_aliases ~/.bash_aliases.backup

# Create symbolic link
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases

# Add to your .bashrc if not already present:
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Reload bash configuration
source ~/.bashrc
```

## Aliases Included

- Navigation shortcuts (`..`, `...`, etc.)
- Enhanced list commands (`ll`, `la`)
- Safe file operations (confirm before overwrite)
- Human-readable sizes for `df` and `du`
- Quick access to edit config files
- Network utilities (`ports`, `myip`)
- And more!