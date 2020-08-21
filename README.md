# Installation
1. Install [Homebrew](https://brew.sh/)  
   `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
2. Install all dependencies from the `Brewfile` through [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand)  
   `brew bundle`
3. Copy `.zshrc` file to home directory
   `cp .zshrc ~/`
4. Install useful key bindings and fuzzy completion by [fzf](https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew)  
   `$(brew --prefix)/opt/fzf/install`
5. Reload Zsh configuration  
   `zsh`
