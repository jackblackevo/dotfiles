# Installation

## macOS
1. Install [Homebrew](https://brew.sh/)
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install all dependencies from the `Brewfile` through [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand)
   ```bash
   curl -fsSLO --output-dir /tmp/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/Brewfile && brew bundle --file /tmp/Brewfile && rm /tmp/Brewfile
   ```
3. Configure [Alacritty](https://alacritty.org/)
   ```bash
   curl -fsSLO --create-dirs --output-dir ~/.config/alacritty/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.config/alacritty/alacritty.yml
   ```
4. Copy `.zshrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.zshrc
   ```
5. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.zimrc
   ```
6. Copy `.p10k.zsh` file (for [Powerlevel10k](https://github.com/romkatv/powerlevel10k)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.p10k.zsh
   ```
7. Install useful key bindings and fuzzy completion by [fzf](https://github.com/junegunn/fzf#using-homebrew)
   ```bash
   $(brew --prefix)/opt/fzf/install
   ```
8. Reload Zsh configuration
   ```bash
   zsh
   ```
9. Copy `.tmux.conf` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.tmux.conf
   ```
10. Install [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.local/bin https://raw.githubusercontent.com/git/git/v2.13.2/contrib/diff-highlight/diff-highlight \
    && chmod +x ~/.local/bin/diff-highlight
    ```
11. Copy `.tigrc` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.tigrc
    ```
12. Configure Neovim, install plugins via [lazy.nvim](https://github.com/folke/lazy.nvim#-usage)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/nvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/init.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/plugins.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/settings.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/mappings.lua \
    && nvim --headless "+Lazy! sync" +qa
    ```
13. Enable repeat on keydown for Visual Studio Code & [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim#-installation)
    ```bash
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    ```
14. Install [LunarVim](https://www.lunarvim.org/)
    ```bash
    LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
    ```
15. Configure LunarVim, install plugins
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/lvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.config/lvim/config.lua \
    && lvim --headless "+Lazy! sync" +qa
    ```

## WSL - Ubuntu
1. Install packages  
   ```bash
   sudo apt update && curl -fsSL https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/pkgs | xargs sudo apt install -y
   ```
2. Copy `.zshrc` file to home directory  
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.zshrc
   ```
3. Copy `.zimrc` file (for [Zim](https://zimfw.sh/)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.zimrc
   ```
4. Copy `.p10k.zsh` file (for [Powerlevel10k](https://github.com/romkatv/powerlevel10k)) to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.p10k.zsh
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
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.tmux.conf
   ```
10. Install [`win32yank.exe`](https://github.com/equalsraf/win32yank)  
    See: [How to use the Windows clipboard from WSL?](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)
    ```bash
    curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip \
    && unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe \
    && chmod +x /tmp/win32yank.exe \
    && mv /tmp/win32yank.exe ~/.local/bin/ \
    && rm /tmp/win32yank.zip
    ```
11. Install [im-select](https://github.com/daipeihust/im-select#windows)
    ```bash
    curl -fsSLo ~/.local/bin/im-select --create-dirs https://github.com/daipeihust/im-select/raw/master/win/out/x64/im-select.exe \
    && chmod +x ~/.local/bin/im-select
    ```
12. Install [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.local/bin https://raw.githubusercontent.com/git/git/v2.13.2/contrib/diff-highlight/diff-highlight \
    && chmod +x ~/.local/bin/diff-highlight
    ```
13. Copy `.tigrc` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.tigrc
    ```
14. Install Neovim [stable version (release build)](https://github.com/neovim/neovim/releases/tag/stable)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.local/bin https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && chmod u+x ~/.local/bin/nvim.appimage && ln -sf ~/.local/bin/nvim.appimage ~/.local/bin/nvim
    ```
15. Configure Neovim, install plugins via [lazy.nvim](https://github.com/folke/lazy.nvim#-usage)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/nvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/init.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/plugins.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/settings.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/mappings.lua \
    && nvim --headless "+Lazy! sync" +qa
    ```
16. Install [LunarVim](https://www.lunarvim.org/)
    ```bash
    LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
    ```
17. Configure LunarVim, install plugins
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/lvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.config/lvim/config.lua \
    && lvim --headless "+Lazy! sync" +qa
    ```
18. Install [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/)
    ```bash
    curl -fsSLo cloudflared.deb --output-dir /tmp/ https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i /tmp/cloudflared.deb ; rm /tmp/cloudflared.deb
    ```
