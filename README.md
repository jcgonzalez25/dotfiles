# dotfiles

Personal dotfiles configuration with modular shell aliases and settings.

## Contents

```
dotfiles/
├── install.sh              # Automated installation script
├── .bashrc                 # Main bash configuration
├── aliases/
│   ├── common.sh          # General system aliases and functions
│   ├── git.sh             # Git shortcuts and workflows
│   ├── docker.sh          # Docker and docker-compose aliases
│   └── dev.sh             # Development tools (Node, Python, etc.)
└── README.md
```

## Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# Run the installation script
cd ~/dotfiles
./install.sh

# Reload your shell
source ~/.bashrc
```

## Manual Installation

If you prefer to set things up manually:

```bash
# Backup existing files
mv ~/.bashrc ~/.bashrc.backup

# Create symbolic links
ln -s ~/dotfiles/.bashrc ~/.bashrc

# Reload configuration
source ~/.bashrc
```

## What's Included

### Common Aliases (`aliases/common.sh`)
- **Navigation**: `..`, `...`, `....` - Quick directory traversal
- **Listing**: `ll`, `la`, `lt`, `lsize` - Enhanced ls commands
- **File Operations**: Safe `cp`, `mv`, `rm` with confirmation
- **System**: `topcpu`, `topmem`, `ports`, `myip` - System monitoring
- **Functions**: `extract()`, `mkcd()` - Useful utilities

### Git Aliases (`aliases/git.sh`)
- **Basic**: `gs` (status), `ga` (add), `gc` (commit), `gp` (push)
- **Branches**: `gco` (checkout), `gcob` (checkout -b), `gb` (branch)
- **Logs**: `gl`, `glog` - Pretty git logs
- **Workflows**: `gcam()`, `gclone()`, `gcleanup()` - Common patterns

### Docker Aliases (`aliases/docker.sh`)
- **Docker**: `d`, `dp`, `di`, `dex`, `dlog` - Container management
- **Compose**: `dc`, `dcu`, `dcd`, `dcl` - Docker Compose shortcuts
- **Cleanup**: `dprune`, `dstopall`, `drmall` - Maintenance
- **Functions**: `dsh()`, `dip()` - Container interaction

### Development Aliases (`aliases/dev.sh`)
- **Python**: `py`, `venv`, `activate` - Python shortcuts
- **Node**: `ni`, `nr`, `ns` - npm/yarn commands
- **Servers**: `serve`, `phpserve` - Quick dev servers
- **Utilities**: `killport()`, `onport()`, `genpass` - Dev tools

## Customization

### Adding Your Own Aliases

Create a `~/.bashrc.local` file for personal customizations:

```bash
# ~/.bashrc.local
export EDITOR=vim
alias myalias='my command'
```

This file is automatically sourced by `.bashrc` and won't be tracked by git.

### Disabling Specific Alias Files

Edit `.bashrc` and comment out the files you don't want:

```bash
# Don't load docker aliases
# [ -r "$DOTFILES_DIR/aliases/docker.sh" ] && . "$DOTFILES_DIR/aliases/docker.sh"
```

## Tips

- Use `reload` alias to reload your bash configuration
- Use `aliases` to quickly edit alias files
- All functions support tab completion
- History is configured for 10,000 entries with deduplication

## Requirements

- Bash 4.0 or higher
- Git (for git aliases)
- Docker (for docker aliases, optional)
- Python 3 (for some dev utilities, optional)

## License

MIT