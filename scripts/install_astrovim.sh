#!/bin/bash
#
# Install AstroVim
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Installing AstroVim ===${NC}\n"

# Check if nvim is installed
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}✗ Neovim is not installed!${NC}"
    echo -e "${YELLOW}Please install Neovim first by running:${NC}"
    echo -e "${YELLOW}  ./scripts/install_tools.sh${NC}"
    exit 1
fi

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -n1 | grep -oP '\d+\.\d+' | head -n1)
REQUIRED_VERSION="0.8"

echo -e "${YELLOW}Neovim version: $NVIM_VERSION${NC}"
echo -e "${YELLOW}Required version: $REQUIRED_VERSION or higher${NC}\n"

# Backup existing config
if [ -d "$HOME/.config/nvim" ]; then
    BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}Backing up existing Neovim config to: $BACKUP_DIR${NC}"
    mv "$HOME/.config/nvim" "$BACKUP_DIR"
fi

if [ -d "$HOME/.local/share/nvim" ]; then
    BACKUP_DIR="$HOME/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}Backing up existing Neovim data to: $BACKUP_DIR${NC}"
    mv "$HOME/.local/share/nvim" "$BACKUP_DIR"
fi

if [ -d "$HOME/.local/state/nvim" ]; then
    BACKUP_DIR="$HOME/.local/state/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}Backing up existing Neovim state to: $BACKUP_DIR${NC}"
    mv "$HOME/.local/state/nvim" "$BACKUP_DIR"
fi

if [ -d "$HOME/.cache/nvim" ]; then
    BACKUP_DIR="$HOME/.cache/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}Backing up existing Neovim cache to: $BACKUP_DIR${NC}"
    mv "$HOME/.cache/nvim" "$BACKUP_DIR"
fi

# Clone AstroVim
echo -e "\n${YELLOW}Cloning AstroVim...${NC}"
git clone --depth 1 https://github.com/AstroNvim/template "$HOME/.config/nvim"

# Remove template's git directory
rm -rf "$HOME/.config/nvim/.git"

echo -e "\n${GREEN}✓ AstroVim installed successfully!${NC}"
echo -e "\n${YELLOW}Next steps:${NC}"
echo -e "1. Run ${BLUE}nvim${NC} to finish the installation"
echo -e "2. AstroVim will automatically install plugins on first launch"
echo -e "3. After plugins install, restart Neovim"
echo -e "\n${YELLOW}Useful AstroVim commands:${NC}"
echo -e "  ${BLUE}<leader>pa${NC} - Update all plugins"
echo -e "  ${BLUE}<leader>pA${NC} - Update AstroVim and all plugins"
echo -e "  ${BLUE}<leader>ps${NC} - Sync plugins"
echo -e "  ${BLUE}<leader>pi${NC} - Plugin installer"
echo -e "\n${YELLOW}Note: Leader key is ${BLUE}<Space>${YELLOW} by default${NC}"
