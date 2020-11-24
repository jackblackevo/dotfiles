# Installation

## macOS
1. Install [Homebrew](https://brew.sh/)
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
   ```
2. Install all dependencies from the `Brewfile` through [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand)
   ```bash
   curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/Brewfile > /tmp/Brewfile && brew bundle --file /tmp/Brewfile ; rm /tmp/Brewfile
   ```
3. Copy `.zshrc` file to home directory
   ```bash
   curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.zshrc > ~/.zshrc
   ```
4. Install useful key bindings and fuzzy completion by [fzf](https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew)
   ```bash
   $(brew --prefix)/opt/fzf/install
   ```
5. Reload Zsh configuration
   ```bash
   zsh
   ```

## WSL - Ubuntu
1. Install [Hack Nerd Font](https://www.nerdfonts.com/font-downloads)  
   Hack Regular Nerd Font Complete Mono Windows Compatible.ttf
2. Install packages  
   ```bash
   curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/pkgs | xargs sudo apt install -y
   ```
3. Install [fzf](https://github.com/junegunn/fzf#using-git)  
   ```bash
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
   ```
4. Install [Z](https://github.com/rupa/z)  
   ```bash
   curl -fsSL https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.local/etc/profile.d/z.sh
   ```
5. Install [Antigen](https://github.com/zsh-users/antigen/wiki/Installation)  
   ```bash
   curl -fsSL https://git.io/antigen > ~/.local/share/antigen/antigen.zsh
   ```
6. Copy `.zshrc` file to home directory  
   ```bash
   curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.zshrc > ~/.zshrc
   ```
7. Reload Zsh configuration  
   ```bash
   zsh
   ```
