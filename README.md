# 🚀 Dotfiles and System Configuration

Welcome to my personal dotfiles repository. This project serves as a centralized way to manage my configuration files (dotfiles) across different Linux machines (primarily targeted towards Debian-based systems like Pop!_OS and Ubuntu). 

By utilizing these dotfiles and the provided installation script, setting up a new environment is streamlined, consistent, and much less tedious.

## 🛠 Prerequisites

Before running the automated installation script, ensure you have basic tools installed:
```bash
sudo apt update && sudo apt install -y git curl
```

## 🚀 Automated Installation

To set up everything automatically, simply clone this repository and execute the installation script. The script is designed to be safe, creating backups of existing configurations before creating new symbolic links.

Bash

```bash
git clone [https://github.com/choetech160/dotfiles.git](https://github.com/choetech160/dotfiles.git) ~/dotfiles
cd ~/dotfiles
chmod +x install_script.sh
./install_script.sh
```

## 📦 Manual Installation & Application Details

If you prefer to install components manually or want to understand what the automated script does, refer to the instructions below.

### 1. Signal Desktop

*Only supports 64-bit Debian-based distributions.*

Bash

```bash
# Install official public software signing key
wget -O- [https://updates.signal.org/desktop/apt/keys.asc](https://updates.signal.org/desktop/apt/keys.asc) | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# Add repository
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] [https://updates.signal.org/desktop/apt](https://updates.signal.org/desktop/apt) xenial main' | sudo tee /etc/apt/sources.list.d/signal-xenial.list

# Install Signal
sudo apt update && sudo apt install -y signal-desktop
```

### 2. Alacritty (Terminal Emulator)

Requires Rust and Cargo to build from source.

Bash

```bash
# Clone the repository
git clone [https://github.com/alacritty/alacritty.git](https://github.com/alacritty/alacritty.git) ~/alacritty
cd ~/alacritty

# Build release
cargo build --release

# Link configuration
ln -sfn ~/dotfiles/alacritty ~/.config/alacritty
```

*For post-install notes, refer to the [official Alacritty installation guide](https://github.com/alacritty/alacritty/blob/master/INSTALL.md).*

### 3. Zsh & Oh My Zsh

Bash

```bash
# Install Zsh
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"
```

### 4. Starship (Cross-Shell Prompt)

Bash

```bash
# Install Starship
curl -sS [https://starship.rs/install.sh](https://starship.rs/install.sh) | sh

# Link configuration
ln -sfn ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sfn ~/dotfiles/zshrc/zshrc ~/.zshrc
```

### 5. Neovim

Bash

```bash
# Install Neovim (Ensure you have a recent version, e.g., via appimage or unstable PPA)
sudo apt install -y neovim

# Link configuration
ln -sfn ~/dotfiles/nvim ~/.config/nvim
```

### 6. Tmux

Bash

```bash
sudo apt install -y tmux

# Link configuration
ln -sfn ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

**Custom Keybindings Overview:**

- `ctrl-a s` : List sessions
- `tmux attach` : Attach to the last session/window
- `tmux detach` : Send tmux to the background
- `ctrl-a c` : Create a new window
- `ctrl-a ,` : Rename the current window
- `ctrl-a 0...9` : Select a window by number (ID/Name located at the top)

### 7. Simplex Chat

Run `simplex-chat` in your terminal to start the application.

### 8. Password Manager

*(Placeholder: Add your preferred password manager installation steps here, e.g., Bitwarden CLI or 1Password).*
