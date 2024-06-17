These are my dotfiles. Mostly for me, when switching to new laptop or reinstalling from scratch, so that said process is more streamlined.
I'll create a script at some point, so that you can either execute it and have everything like me (not advised btw).

# Install Signal

> NOTE: These instructions only work for 64-bit Debian-based
> Linux distributions such as Ubuntu, Mint etc.

> 1. Install our official public software signing key:
>    `wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg

      cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null`

> 2. Add our repository to your list of repositories:

```bash
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
```

> 3. Update your package database and install Signal:
>    sudo apt update && sudo apt install signal-desktop

# Install alacritty

```
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
ln -s ./dotfiles/alacritty ~/.config/alacritty
```

for post install notes, see [here](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)

# Install oh-my-zsh

```bash
git clone # need to be done, added starship in there as well
```

# Install neovim

```bash
git clone https://github.com/choetech160/dotfiles
ln -s ./dotfiles/nvim ~/.config/nvim
```

# Install starship

https://starship.rs/guide/

```bash
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init zsh)"
git clone https://github.com/choetech160/dotfiles
ln -s ./dotfiles/starship.toml ~/.config/starship.toml
ln -s ./dotfiles/zshrc/zshrc ~/.zshrc
```

# Install a password manager

# Install TMUX

```bash
sudo apt install tmux
git clone https://github.com/choetech160/dotfiles
ln -s ./dotfiles/tmux/tmux.conf ~/.tmux.conf

```

```bash
ctrl-a s -> list sessions
temux attach -> attach to a session / window
temux detach -> let temux run in background (attach to re-attach to it)
ctrl-a c -> create new window
ctrl-a , -> rename current window
ctrl-a 0...9 -> select window by number (window id+name are on top by using my config)
```

# simplex-chat

`simplex-chat` to start simplex
