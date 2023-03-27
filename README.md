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
5. Install useful key bindings and fuzzy completion by [fzf](https://github.com/junegunn/fzf#using-homebrew)
   ```bash
   $(brew --prefix)/opt/fzf/install
   ```
6. Reload Zsh configuration
   ```bash
   zsh
   ```
7. Copy `.tmux.conf` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.tmux.conf
   ```
8. Install [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight)
   ```bash
   curl -fsSLO --create-dirs --output-dir ~/.local/bin https://raw.githubusercontent.com/git/git/v2.13.2/contrib/diff-highlight/diff-highlight \
   && chmod +x ~/.local/bin/diff-highlight
   ```
9. Copy `.tigrc` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.tigrc
   ```
10. Configure Neovim, install plugins via [packer.nvim](https://github.com/wbthomason/packer.nvim#bootstrapping)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/nvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/init.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/plugins.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/settings.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/mappings.lua \
    && nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    ```
11. Enable repeat on keydown for Visual Studio Code & [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim#-installation)
    ```bash
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    ```
12. Install [LunarVim](https://www.lunarvim.org/)
    ```bash
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    ```
13. Configure LunarVim, install plugins
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/lvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/macOS/.config/lvim/config.lua \
    && lvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    ```
14. Install [eslint_d](https://github.com/mantoni/eslint_d.js) for [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
    ```bash
    npm install -g eslint_d
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
3. Reload Zsh configuration  
   ```bash
   zsh
   ```
4. Download & Install [Hack Nerd Font](https://www.nerdfonts.com/font-downloads)
   ```bash
   curl -fLo "Hack Regular Nerd Font Complete Mono Windows Compatible.ttf" \
   https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf \
   && explorer.exe .
   ```
5. Configure Windows Terminal
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
   }
   ```
6. Set Zsh as default shell
   ```bash
   chsh -s $(which zsh)
   ```
7. Copy `.tmux.conf` file to home directory
   ```bash
   curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.tmux.conf
   ```
8. Install [`win32yank.exe`](https://github.com/equalsraf/win32yank)  
   See: [How to use the Windows clipboard from WSL?](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)
   ```bash
   curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
   unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
   chmod +x /tmp/win32yank.exe
   sudo mv /tmp/win32yank.exe /usr/local/bin/
   ```
9. Install [im-select](https://github.com/daipeihust/im-select#manual-download)
   ```bash
   curl -fsSLo ~/.local/bin/im-select --create-dirs https://github.com/daipeihust/im-select/raw/master/im-select-win/out/x64/im-select.exe \
   && chmod +x ~/.local/bin/im-select
   ```
10. Install [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.local/bin https://raw.githubusercontent.com/git/git/v2.13.2/contrib/diff-highlight/diff-highlight \
    && chmod +x ~/.local/bin/diff-highlight
    ```
11. Copy `.tigrc` file to home directory
    ```bash
    curl -fsSLO --output-dir ~/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.tigrc
    ```
12. Install Neovim [stable version (release build)](https://github.com/neovim/neovim/releases/tag/stable)
    ```bash
    curl -fsSLO --output-dir /tmp/ https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb && sudo apt install /tmp/nvim-linux64.deb ; rm /tmp/nvim-linux64.deb
    ```
13. Configure Neovim, install plugins via [packer.nvim](https://github.com/wbthomason/packer.nvim#bootstrapping)
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/nvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/init.lua \
    && curl -fsSLO --create-dirs --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/plugins.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/settings.lua \
    && curl -fsSLO --output-dir ~/.config/nvim/lua/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/.config/nvim/lua/mappings.lua \
    && nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    ```
14. Install [LunarVim](https://www.lunarvim.org/)
    ```bash
    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    ```
15. Configure LunarVim, install plugins
    ```bash
    curl -fsSLO --create-dirs --output-dir ~/.config/lvim/ https://raw.githubusercontent.com/jackblackevo/dotfiles/master/Ubuntu/.config/lvim/config.lua \
    && lvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    ```
16. Install [eslint_d](https://github.com/mantoni/eslint_d.js) for [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
    ```bash
    npm install -g eslint_d
    ```
17. Install [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/)
    ```bash
    curl -fsSLo cloudflared.deb --output-dir /tmp/ https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i /tmp/cloudflared.deb ; rm /tmp/cloudflared.deb
    ```
