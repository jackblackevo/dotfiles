# Prevent Ubuntu's /etc/zsh/zshrc from calling compinit, as zimfw/completion
# manages compinit instead
# See:
# - /etc/zsh/zshrc
# - https://github.com/zimfw/completion
skip_global_compinit=1

# Match tmux's default-terminal for true color and Neovim compatibility inside tmux
# See: .tmux.conf
export TERM=screen-256color

# PATH: colon-separated list of directories to search for executables
# $HOME: current user's home directory (e.g. /home/username)
# $HOME/.local/bin: user-specific executable directory (no root required)
# See: https://manpages.ubuntu.com/manpages/noble/man7/file-hierarchy.7.html
export PATH="$HOME/.local/bin:$PATH"

export VISUAL=vim
export EDITOR="$VISUAL"

# Use agkozak/zsh-z instead of rupa/z for mrjohannchang/fz.sh
# https://github.com/changyuheng/fz.sh/issues/21#issuecomment-541839988
export FZ_HISTORY_CD_CMD=zshz

# https://github.com/lukechilds/zsh-nvm#auto-use
export NVM_AUTO_USE=true
