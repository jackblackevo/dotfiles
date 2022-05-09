# Installation

## macOS
1. Install [Homebrew](https://brew.sh/)
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
6. Configure Neovim
   ```bash
   mkdir -p ~/.config/nvim/ \
   && curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/init.vim > ~/.config/nvim/init.vim \
   && curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/vscode.vim > ~/.config/nvim/vscode.vim
   ```

## WSL - Ubuntu
1. Install packages  
   ```bash
   sudo apt update && curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/pkgs | xargs sudo apt install -y
   ```
2. Install [fzf](https://github.com/junegunn/fzf#using-git)  
   ```bash
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
   ```
3. Install [Z](https://github.com/rupa/z)  
   ```bash
   mkdir -p ~/.local/etc/profile.d/ && curl -fsSL https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.local/etc/profile.d/z.sh
   ```
4. Install [Antigen](https://github.com/zsh-users/antigen/wiki/Installation)  
   ```bash
   mkdir -p ~/.local/share/antigen/ && curl -fsSL https://git.io/antigen > ~/.local/share/antigen/antigen.zsh
   ```
5. Copy `.zshrc` file to home directory  
   ```bash
   curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.zshrc > ~/.zshrc
   ```
6. Reload Zsh configuration  
   ```bash
   zsh
   ```
7. Install [Hack Nerd Font](https://www.nerdfonts.com/font-downloads)  
   Hack Regular Nerd Font Complete Mono Windows Compatible.ttf
8. Configure Windows Terminal
   ```jsonc
   {
       // actions
       [
           {
                "command":
                {
                    "action": "copy",
                    "singleLine": false
                },
                "keys": "ctrl+shift+c"
            },
            {
                "command": "paste",
                "keys": "ctrl+shift+v"
            },
       ],
       // profiles.list
       "colorScheme": "Solarized Dark",
       "font":
       {
           "face": "Hack NF"
       },
       "startingDirectory": "\\\\wsl$\\Ubuntu-20.04\\home\\jackblackevo"
   }
   ```
9. Set Zsh as default shell
   ```bash
   chsh -s $(which zsh)
   ```
10. Install [`win32yank.exe`](https://github.com/equalsraf/win32yank)  
    See: [How to use the Windows clipboard from WSL?](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)
    ```bash
    curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    chmod +x /tmp/win32yank.exe
    sudo mv /tmp/win32yank.exe /usr/local/bin/
    ```
11. Configure Neovim
    ```bash
    mkdir -p ~/.config/nvim/ \
    && curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/init.vim > ~/.config/nvim/init.vim \
    && curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/vscode.vim > ~/.config/nvim/vscode.vim
    ```
