#!/bin/bash
#
# Install common development tools
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Installing Development Tools ===${NC}\n"

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    # Detect distro
    if [ -f /etc/debian_version ]; then
        DISTRO="debian"
    elif [ -f /etc/redhat-release ]; then
        DISTRO="redhat"
    elif [ -f /etc/arch-release ]; then
        DISTRO="arch"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
fi

echo -e "${YELLOW}Detected OS: $OS${NC}\n"

# Install function
install_tool() {
    local tool_name=$1
    local install_cmd=$2

    if command -v "$tool_name" &> /dev/null; then
        echo -e "${GREEN}✓ $tool_name already installed${NC}"
    else
        echo -e "${YELLOW}Installing $tool_name...${NC}"
        eval "$install_cmd"
        if command -v "$tool_name" &> /dev/null; then
            echo -e "${GREEN}✓ $tool_name installed successfully${NC}"
        else
            echo -e "${RED}✗ Failed to install $tool_name${NC}"
        fi
    fi
}

# Update package manager
if [ "$OS" = "linux" ]; then
    if [ "$DISTRO" = "debian" ]; then
        echo -e "${YELLOW}Updating apt...${NC}"
        sudo apt update
    elif [ "$DISTRO" = "arch" ]; then
        echo -e "${YELLOW}Updating pacman...${NC}"
        sudo pacman -Sy
    fi
elif [ "$OS" = "macos" ]; then
    if ! command -v brew &> /dev/null; then
        echo -e "${YELLOW}Installing Homebrew...${NC}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi

echo ""

# Neovim
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "nvim" "sudo apt install -y neovim"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "nvim" "sudo pacman -S --noconfirm neovim"
elif [ "$OS" = "macos" ]; then
    install_tool "nvim" "brew install neovim"
fi

# Lazygit
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "lazygit" "LAZYGIT_VERSION=\$(curl -s 'https://api.github.com/repos/jesseduffield/lazygit/releases/latest' | grep -Po '\"tag_name\": \"v\K[^\"]*') && curl -Lo lazygit.tar.gz \"https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_\${LAZYGIT_VERSION}_Linux_x86_64.tar.gz\" && tar xf lazygit.tar.gz lazygit && sudo install lazygit /usr/local/bin && rm lazygit lazygit.tar.gz"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "lazygit" "sudo pacman -S --noconfirm lazygit"
elif [ "$OS" = "macos" ]; then
    install_tool "lazygit" "brew install lazygit"
fi

# fzf - Fuzzy finder
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "fzf" "sudo apt install -y fzf"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "fzf" "sudo pacman -S --noconfirm fzf"
elif [ "$OS" = "macos" ]; then
    install_tool "fzf" "brew install fzf"
fi

# ripgrep - Fast grep
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "rg" "sudo apt install -y ripgrep"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "rg" "sudo pacman -S --noconfirm ripgrep"
elif [ "$OS" = "macos" ]; then
    install_tool "rg" "brew install ripgrep"
fi

# bat - Cat with syntax highlighting
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "bat" "sudo apt install -y bat && mkdir -p ~/.local/bin && ln -s /usr/bin/batcat ~/.local/bin/bat"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "bat" "sudo pacman -S --noconfirm bat"
elif [ "$OS" = "macos" ]; then
    install_tool "bat" "brew install bat"
fi

# eza - Modern ls replacement
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    if ! command -v eza &> /dev/null; then
        echo -e "${YELLOW}Installing eza...${NC}"
        sudo apt install -y gpg
        sudo mkdir -p /etc/apt/keyrings
        wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
        echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
        sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
        sudo apt update
        sudo apt install -y eza
        echo -e "${GREEN}✓ eza installed successfully${NC}"
    else
        echo -e "${GREEN}✓ eza already installed${NC}"
    fi
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "eza" "sudo pacman -S --noconfirm eza"
elif [ "$OS" = "macos" ]; then
    install_tool "eza" "brew install eza"
fi

# zoxide - Smart cd
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "zoxide" "curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "zoxide" "sudo pacman -S --noconfirm zoxide"
elif [ "$OS" = "macos" ]; then
    install_tool "zoxide" "brew install zoxide"
fi

# fd - Fast find alternative
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "fd" "sudo apt install -y fd-find && mkdir -p ~/.local/bin && ln -s \$(which fdfind) ~/.local/bin/fd"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "fd" "sudo pacman -S --noconfirm fd"
elif [ "$OS" = "macos" ]; then
    install_tool "fd" "brew install fd"
fi

# tldr - Simplified man pages
if [ "$OS" = "linux" ]; then
    install_tool "tldr" "sudo apt install -y tldr || pip3 install tldr"
elif [ "$OS" = "macos" ]; then
    install_tool "tldr" "brew install tldr"
fi

# tmux - Terminal multiplexer
if [ "$OS" = "linux" ] && [ "$DISTRO" = "debian" ]; then
    install_tool "tmux" "sudo apt install -y tmux"
elif [ "$OS" = "linux" ] && [ "$DISTRO" = "arch" ]; then
    install_tool "tmux" "sudo pacman -S --noconfirm tmux"
elif [ "$OS" = "macos" ]; then
    install_tool "tmux" "brew install tmux"
fi

echo ""
echo -e "${GREEN}=== Installation Complete! ===${NC}"
echo -e "${YELLOW}Note: You may need to restart your terminal for some changes to take effect.${NC}"
