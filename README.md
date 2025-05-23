# Installation

## macOS

1. Install [Homebrew](https://brew.sh/)
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install all dependencies from the `Brewfile` through [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand)
   ```bash
   brew update \
   && brew upgrade \
   && curl -fsSL https://github.com/jackblackevo/dotfiles/raw/main/macOS/Brewfile | brew bundle --file=- \
   && brew cleanup
   ```
3. Configure [Alacritty](https://alacritty.org/)
   ```bash
   curl -fsSLO --create-dirs --output-dir ~/.config/alacritty/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.config/alacritty/alacritty.toml
   ```
4. Copy `.zshenv` and `.zshrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.zshenv \
   && curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.zshrc
   ```
5. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.zimrc
   ```
6. Copy `.p10k.zsh` file (for [Powerlevel10k](https://github.com/romkatv/powerlevel10k)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.p10k.zsh
   ```
7. Reload Zsh configuration
   ```bash
   zsh
   ```
8. Copy `.tmux.conf` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.tmux.conf
   ```
9. Copy `.tigrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.tigrc
   ```
10. Install [AstroNvim](https://astronvim.com/) (use [unattended](https://docs.astronvim.com/reference/alt_install/#unattended-installation) and [isolated](https://docs.astronvim.com/reference/alt_install/#isolated-installation) installation)  
    See: [AstroNvim configuration](https://github.com/jackblackevo/astronvim_config)
    ```bash
    git clone https://github.com/jackblackevo/astronvim_config.git ~/.config/astronvim \
    && NVIM_APPNAME=astronvim nvim --headless +q
    ```

## WSL - Ubuntu

1. Install packages
   ```bash
   sudo apt update \
   && sudo apt upgrade -y \
   && curl -fsSL https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/pkgs | xargs sudo apt install -y \
   && sudo apt clean \
   && curl -fsSL https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/win-pkgs | xargs winget.exe install
   ```
2. Copy `.zshenv` and `.zshrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zshenv \
   && curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zshrc
   ```
3. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zimrc
   ```
4. Copy `.p10k.zsh` file (for [Powerlevel10k](https://github.com/romkatv/powerlevel10k)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.p10k.zsh
   ```
5. Reload Zsh configuration
   ```bash
   zsh
   ```
6. Download & Install [Hack Nerd Font](https://www.nerdfonts.com/font-downloads)
   ```bash
   curl -fsSLO --output-dir /mnt/c/temp/ https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFontMono-Regular.ttf \
   && explorer.exe "c:\temp"
   ```
7. Configure Windows Terminal
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
       "colorScheme": "One Half Dark",
       "font":
       {
           "face": "Hack Nerd Font Mono"
       },
   }
   ```
8. Set Zsh as default shell
   ```bash
   chsh -s $(which zsh)
   ```
9. Copy `.tmux.conf` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.tmux.conf
   ```
10. Make [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight) executable
    ```bash
    sudo chmod +x $(git --exec-path)/../../share/doc/git/contrib/diff-highlight/diff-highlight
    ```
11. Copy `.tigrc` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.tigrc
    ```
12. Install Neovim [stable version (release build)](https://github.com/neovim/neovim/releases/tag/stable)
    ```bash
    curl -fsSL --create-dirs --output ~/.local/bin/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage && chmod u+x ~/.local/bin/nvim.appimage && ln -sf ~/.local/bin/nvim.appimage ~/.local/bin/nvim
    ```
13. Install [AstroNvim](https://astronvim.com/) (use [unattended](https://docs.astronvim.com/reference/alt_install/#unattended-installation) and [isolated](https://docs.astronvim.com/reference/alt_install/#isolated-installation) installation)  
    See: [AstroNvim configuration](https://github.com/jackblackevo/astronvim_config)
    ```bash
    git clone https://github.com/jackblackevo/astronvim_config.git ~/.config/astronvim \
    && NVIM_APPNAME=astronvim nvim --headless +q
    ```
