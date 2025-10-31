#!/bin/bash
#
# Dotfiles Installation Script
#
# This script will:
# 1. Backup existing dotfiles
# 2. Create symbolic links from your home directory to the dotfiles repo
# 3. Optionally install development tools
# 4. Optionally install AstroVim
# 5. Source the new bashrc

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the dotfiles directory (where this script is located)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Dotfiles Installation Script      ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# Create backup directory
if [ ! -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Creating backup directory: $BACKUP_DIR${NC}"
    mkdir -p "$BACKUP_DIR"
fi

# Function to backup and link a file
backup_and_link() {
    local source_file="$1"
    local target_file="$2"

    # If target exists and is not a symlink, back it up
    if [ -e "$target_file" ] && [ ! -L "$target_file" ]; then
        echo -e "${YELLOW}Backing up existing $target_file${NC}"
        mv "$target_file" "$BACKUP_DIR/"
    fi

    # Remove existing symlink if it exists
    if [ -L "$target_file" ]; then
        echo -e "${YELLOW}Removing existing symlink $target_file${NC}"
        rm "$target_file"
    fi

    # Create new symlink
    echo -e "${GREEN}Linking $source_file -> $target_file${NC}"
    ln -s "$source_file" "$target_file"
}

# Install bashrc
if [ -f "$DOTFILES_DIR/.bashrc" ]; then
    backup_and_link "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
fi

# Install lazygit config
if [ -f "$DOTFILES_DIR/configs/lazygit/config.yml" ]; then
    mkdir -p "$HOME/.config/lazygit"
    backup_and_link "$DOTFILES_DIR/configs/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"
fi

echo ""
echo -e "${GREEN}✓ Dotfiles linked successfully!${NC}"

if [ -d "$BACKUP_DIR" ] && [ "$(ls -A $BACKUP_DIR)" ]; then
    echo -e "${YELLOW}Your old dotfiles have been backed up to: $BACKUP_DIR${NC}"
else
    rmdir "$BACKUP_DIR" 2>/dev/null
fi

# Ask about installing tools
echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
read -p "$(echo -e ${YELLOW}Install development tools \(neovim, lazygit, fzf, ripgrep, etc.\)? \[y/N\]: ${NC})" -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -f "$DOTFILES_DIR/scripts/install_tools.sh" ]; then
        echo -e "${YELLOW}Installing development tools...${NC}"
        bash "$DOTFILES_DIR/scripts/install_tools.sh"
    else
        echo -e "${RED}Error: install_tools.sh not found${NC}"
    fi
fi

# Ask about installing AstroVim
echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
read -p "$(echo -e ${YELLOW}Install AstroVim? \[y/N\]: ${NC})" -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -f "$DOTFILES_DIR/scripts/install_astrovim.sh" ]; then
        bash "$DOTFILES_DIR/scripts/install_astrovim.sh"
    else
        echo -e "${RED}Error: install_astrovim.sh not found${NC}"
    fi
fi

echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        Installation Complete! 🎉       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}To apply the changes, run:${NC}"
echo -e "  ${YELLOW}source ~/.bashrc${NC}"
echo ""
echo -e "${GREEN}Or simply restart your terminal.${NC}"
echo ""
echo -e "${YELLOW}Useful commands:${NC}"
echo -e "  ${BLUE}yc${NC}       - Claude CLI (skip permissions)"
echo -e "  ${BLUE}ycc${NC}      - Claude Code"
echo -e "  ${BLUE}v${NC}        - Open Neovim"
echo -e "  ${BLUE}lazygit${NC}  - Git TUI"
echo -e "  ${BLUE}reload${NC}   - Reload bash config"
echo ""
