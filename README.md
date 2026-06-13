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
4. Copy `.zprofile` and `.zshrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.zprofile \
   && curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.zshrc
   ```
5. Copy `.ssh/config` file to `~/.ssh` directory (keeps SSH keys in ssh-agent with passphrases stored in the macOS Keychain, pairing with the `ssh-add --apple-load-keychain` run in `.zshrc`)
   ```bash
   curl -fsSLO --create-dirs --output-dir ~/.ssh/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.ssh/config
   ```
6. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.zimrc
   ```
7. Copy `.p10k.zsh` file (for [Powerlevel10k](https://github.com/romkatv/powerlevel10k)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.p10k.zsh
   ```
8. Reload Zsh configuration
   ```bash
   zsh
   ```
9. Copy `.tmux.conf` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.tmux.conf
   ```
10. Copy `.tigrc` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.tigrc
    ```
11. Install [AstroNvim](https://astronvim.com/) (use [unattended](https://docs.astronvim.com/reference/alt_install/#unattended-installation) and [isolated](https://docs.astronvim.com/reference/alt_install/#isolated-installation) installation)  
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
   && curl -fsSL https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/pkgs | grep -vE '^[[:space:]]*#' | xargs sudo apt install -y \
   && sudo apt clean \
   && curl -fsSL https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/win-pkgs | grep -vE '^[[:space:]]*#' | xargs winget.exe install
   ```
2. Copy `.zshenv`, `.zprofile` and `.zshrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zshenv \
   && curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zprofile \
   && curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zshrc
   ```
3. Copy `.ssh/config` file to `~/.ssh` directory (re-adds SSH keys to the systemd-managed ssh-agent on use, pairing with the `SSH_AUTH_SOCK` set in `.zshenv` and the `ssh-add` run in `.zshrc`)
   ```bash
   curl -fsSLO --create-dirs --output-dir ~/.ssh/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.ssh/config
   ```
4. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zimrc
   ```
5. Copy `.p10k.zsh` file (for [Powerlevel10k](https://github.com/romkatv/powerlevel10k)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.p10k.zsh
   ```
6. Reload Zsh configuration
   ```bash
   zsh
   ```
7. Download & Install [Hack Nerd Font](https://www.nerdfonts.com/font-downloads)
   ```bash
   curl -fsSLO --output-dir /mnt/c/temp/ https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFontMono-Regular.ttf \
   && explorer.exe "c:\temp"
   ```
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
       "colorScheme": "One Half Dark",
       "font":
       {
           "face": "Hack Nerd Font Mono"
       },
   }
   ```
9. Set Zsh as default shell
   ```bash
   chsh -s $(which zsh)
   ```
10. Copy `.tmux.conf` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.tmux.conf
    ```
11. Make [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight) executable and symlink to `~/.local/bin`
    ```bash
    sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight \
    && mkdir -p ~/.local/bin/ \
    && ln -sf /usr/share/doc/git/contrib/diff-highlight/diff-highlight ~/.local/bin/diff-highlight
    ```
12. Copy `.tigrc` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.tigrc
    ```
13. Install Neovim [stable version (release build)](https://github.com/neovim/neovim/releases/tag/stable)
    ```bash
    curl -fsSL --create-dirs --output ~/.local/bin/nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage \
    && chmod u+x ~/.local/bin/nvim.appimage \
    && ln -sf ~/.local/bin/nvim.appimage ~/.local/bin/nvim
    ```
14. Install [AstroNvim](https://astronvim.com/) (use [unattended](https://docs.astronvim.com/reference/alt_install/#unattended-installation) and [isolated](https://docs.astronvim.com/reference/alt_install/#isolated-installation) installation)  
    See: [AstroNvim configuration](https://github.com/jackblackevo/astronvim_config)
    ```bash
    git clone https://github.com/jackblackevo/astronvim_config.git ~/.config/astronvim \
    && NVIM_APPNAME=astronvim nvim --headless +q
    ```
