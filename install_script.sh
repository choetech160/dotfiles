#!/usr/bin/env bash

# ==============================================================================
# Dotfiles Installation Script
# ==============================================================================
# This script safely installs packages, configures Oh My Zsh, and links dotfiles.
# It uses absolute paths and creates backups of existing configurations.
# ==============================================================================

set -e # Exit immediately if a command exits with a non-zero status

# --- Styling & Colors ---
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# --- Variables & Paths ---
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Ensure .config exists
mkdir -p "$CONFIG_DIR"

# --- Helper Functions ---
log_step() { echo -e "\n${BLUE}==> $1${NC}"; }
log_success() { echo -e "${GREEN}  ✓ $1${NC}"; }
log_warn() { echo -e "${YELLOW}  ! $1${NC}"; }
log_error() {
  echo -e "${RED}  ✗ $1${NC}"
  exit 1
}

# Safely create symbolic links with backup
create_symlink() {
  local src="$1"
  local dest="$2"

  if [ ! -e "$src" ]; then
    log_warn "Source $src does not exist. Skipping..."
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$(readlink -f "$dest")" = "$src" ]; then
      log_success "$dest is already correctly linked."
      return
    fi

    mkdir -p "$BACKUP_DIR"
    log_warn "Backing up existing $(basename "$dest") to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi

  ln -sfn "$src" "$dest"
  log_success "Linked $src -> $dest"
}

# Check if command exists
command_exists() { command -v "$1" >/dev/null 2>&1; }

# --- Installation Steps ---

log_step "Updating system and installing base dependencies..."
sudo apt update
sudo apt install -y curl git build-essential gpg tmux zsh neovim

log_step "Installing Signal Desktop..."
if ! command_exists signal-desktop; then
  wget -qO- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor >/tmp/signal-desktop-keyring.gpg
  cat /tmp/signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg >/dev/null
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee /etc/apt/sources.list.d/signal-xenial.list >/dev/null
  sudo apt update
  sudo apt install -y signal-desktop
  log_success "Signal installed successfully."
else
  log_success "Signal is already installed."
fi

log_step "Installing Rust & Alacritty..."
if ! command_exists cargo; then
  log_warn "Rust (cargo) not found. Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
fi

if ! command_exists alacritty; then
  if [ ! -d "$HOME/alacritty" ]; then
    git clone https://github.com/alacritty/alacritty.git "$HOME/alacritty"
  fi
  cd "$HOME/alacritty"
  cargo build --release
  # Optional: sudo cp target/release/alacritty /usr/local/bin/
  log_success "Alacritty built."
else
  log_success "Alacritty already available."
fi

log_step "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  log_success "Oh My Zsh installed."
else
  log_success "Oh My Zsh already installed."
fi

log_step "Installing Starship Prompt..."
if ! command_exists starship; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  log_success "Starship installed."
else
  log_success "Starship already installed."
fi

log_step "Linking Configuration Files (Dotfiles)..."
create_symlink "$DOTFILES_DIR/alacritty" "$CONFIG_DIR/alacritty"
create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
create_symlink "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"
create_symlink "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

if [ -f "$DOTFILES_DIR/zshrc/zshrc" ]; then
  create_symlink "$DOTFILES_DIR/zshrc/zshrc" "$HOME/.zshrc"
elif [ -f "$DOTFILES_DIR/.zshrc" ]; then
  create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
fi

log_step "Setting Zsh as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s "$(which zsh)"
  log_success "Default shell changed to Zsh. (Requires logout/login to take effect)"
else
  log_success "Zsh is already the default shell."
fi

echo -e "\n${GREEN}====================================================${NC}"
echo -e "${GREEN}🎉 Setup Complete! 🎉${NC}"
echo -e "${GREEN}====================================================${NC}"
if [ -d "$BACKUP_DIR" ] && [ "$(ls -A "$BACKUP_DIR")" ]; then
  echo -e "Your previous configuration files were backed up to: ${YELLOW}$BACKUP_DIR${NC}"
fi
echo -e "Please restart your terminal or log out and log back in for all changes to take effect."
