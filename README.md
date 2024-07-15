# Installation

## macOS

1. Install [Homebrew](https://brew.sh/)
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install all dependencies from the `Brewfile` through [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand)
   ```bash
   curl -fsSLO --output-dir /tmp/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/Brewfile \
   && brew update \
   && brew upgrade \
   && brew bundle --file /tmp/Brewfile \
   && brew cleanup \
   && rm /tmp/Brewfile
   ```
3. Configure [Alacritty](https://alacritty.org/)
   ```bash
   curl -fsSLO --create-dirs --output-dir ~/.config/alacritty/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.config/alacritty/alacritty.toml
   ```
4. Copy `.zshrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/macOS/.zshrc
   ```
5. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.zimrc \
   && zimfw update \
   && zimfw upgrade \
   && zimfw clean
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
10. Configure Neovim for [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim), install plugins via [lazy.nvim](https://github.com/folke/lazy.nvim#-usage)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/vscode-neovim/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/init.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/vscode-neovim/lua/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/lua/plugins.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/vscode-neovim/lua/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/lua/settings.lua \
    && curl -fsSLO --output-dir ~/.config/vscode-neovim/lua/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/lua/mappings.lua \
    && NVIM_APPNAME=vscode-neovim nvim --headless "+Lazy! sync" +qa
    ```
11. Enable repeat on keydown for Visual Studio Code & [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim#-installation)
    ```bash
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    ```
12. Install [AstroNvim](https://astronvim.com/) (use [unattended installation](https://docs.astronvim.com/reference/alt_install/#unattended-installation))
    ```bash
    git clone git@github.com:jackblackevo/astronvim_config.git ~/.config/astronvim \
    && NVIM_APPNAME=astronvim nvim --headless +q
    ```

## WSL - Ubuntu

1. Install packages
   ```bash
   sudo apt update && sudo apt upgrade -y && curl -fsSL https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/pkgs | xargs sudo apt install -y && sudo apt clean
   ```
2. Copy `.zshrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.zshrc
   ```
3. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/.zimrc \
   && zimfw update \
   && zimfw upgrade \
   && zimfw clean
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
10. Install [`win32yank.exe`](https://github.com/equalsraf/win32yank)  
    See: [Clipboard integration](https://neovim.io/doc/user/provider.html#provider-clipboard)  
    Note:
    - [clip.exe](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/clip) does not support UTF-8.
    - https://github.com/equalsraf/win32yank/issues/9#issuecomment-1384523965
    ```bash
    winget.exe install win32yank
    ```
11. Make [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight) executable
    ```bash
    sudo chmod +x $(git --exec-path)/../../share/doc/git/contrib/diff-highlight/diff-highlight
    ```
12. Copy `.tigrc` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://github.com/jackblackevo/dotfiles/raw/main/Ubuntu/.tigrc
    ```
13. Install Neovim [stable version (release build)](https://github.com/neovim/neovim/releases/tag/stable)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.local/bin https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && chmod u+x ~/.local/bin/nvim.appimage && ln -sf ~/.local/bin/nvim.appimage ~/.local/bin/nvim
    ```
14. Configure Neovim for [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim), install plugins via [lazy.nvim](https://github.com/folke/lazy.nvim#-usage)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/vscode-neovim/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/init.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/vscode-neovim/lua/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/lua/plugins.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/vscode-neovim/lua/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/lua/settings.lua \
    && curl -fsSLO --output-dir ~/.config/vscode-neovim/lua/ https://github.com/jackblackevo/dotfiles/raw/main/.config/vscode-neovim/lua/mappings.lua \
    && NVIM_APPNAME=vscode-neovim nvim --headless "+Lazy! sync" +qa
    ```
15. Install [AstroNvim](https://astronvim.com/) (use [unattended installation](https://docs.astronvim.com/reference/alt_install/#unattended-installation))
    ```bash
    git clone git@github.com:jackblackevo/astronvim_config.git ~/.config/astronvim \
    && NVIM_APPNAME=astronvim nvim --headless +q
    ```
16. Install [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/)
    ```bash
    curl -fsSLo cloudflared.deb --output-dir /tmp/ https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i /tmp/cloudflared.deb ; rm /tmp/cloudflared.deb
    ```
