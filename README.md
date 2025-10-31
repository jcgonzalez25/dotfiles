# dotfiles

Personal dotfiles configuration with modular shell aliases, development tools installer, and configs.

## Contents

```
dotfiles/
├── install.sh              # Interactive installation script
├── .bashrc                 # Main bash configuration
├── aliases/
│   ├── common.sh          # General system aliases and functions
│   ├── git.sh             # Git shortcuts and workflows
│   ├── docker.sh          # Docker and docker-compose aliases
│   └── dev.sh             # Development tools (Node, Python, nvim, Claude)
├── scripts/
│   ├── install_tools.sh   # Install CLI tools (lazygit, fzf, ripgrep, etc.)
│   └── install_astrovim.sh # Install AstroVim configuration
├── configs/
│   └── lazygit/
│       └── config.yml     # Lazygit configuration with vim keybindings
└── README.md
```

## Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# Run the interactive installation script
cd ~/dotfiles
./install.sh

# The script will prompt you to:
# 1. Install dotfiles (bashrc, aliases)
# 2. Install development tools (optional)
# 3. Install AstroVim (optional)

# Reload your shell
source ~/.bashrc
```

## Installation Options

### Option 1: Full Installation (Recommended)

Run `./install.sh` and answer "yes" to all prompts. This will:
- Set up all aliases and bash configuration
- Install development tools (neovim, lazygit, fzf, ripgrep, bat, eza, zoxide, fd, tmux, tldr)
- Install and configure AstroVim

### Option 2: Dotfiles Only

Run `./install.sh` and answer "no" to tool installation prompts.

### Option 3: Individual Scripts

```bash
# Install just the tools
./scripts/install_tools.sh

# Install just AstroVim
./scripts/install_astrovim.sh
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
- **Editors**: `v` (nvim) - Neovim shortcut
- **Claude CLI**: `yc` (with skip permissions), `ycc` (code), `ycs` (chat), `yce` (edit)
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

## Development Tools Installed

The `install_tools.sh` script installs the following tools:

- **Neovim** - Modern Vim-based text editor
- **Lazygit** - Terminal UI for git commands
- **fzf** - Fuzzy finder for files and command history
- **ripgrep** - Ultra-fast grep alternative
- **bat** - Cat with syntax highlighting
- **eza** - Modern ls replacement with colors
- **zoxide** - Smarter cd command that learns your habits
- **fd** - Fast and user-friendly find alternative
- **tmux** - Terminal multiplexer
- **tldr** - Simplified man pages

## AstroVim Configuration

AstroVim is a feature-rich Neovim configuration with:
- LSP support out of the box
- Treesitter syntax highlighting
- File explorer and fuzzy finder
- Git integration
- Beautiful UI with status line
- Many pre-configured plugins

After installation, run `nvim` and wait for plugins to install automatically.

## Tips

- Use `reload` alias to reload your bash configuration
- Use `aliases` to quickly edit alias files
- Use `v` to open Neovim, `lazygit` for git TUI
- All functions support tab completion
- History is configured for 10,000 entries with deduplication

## Requirements

**Minimum:**
- Bash 4.0 or higher
- Git

**Optional (installed by scripts):**
- Neovim 0.8+ (for AstroVim)
- All development tools listed above

**For specific aliases:**
- Docker (for docker aliases)
- Python 3 (for some dev utilities)
- Node.js/npm (for node aliases)

## License

MIT