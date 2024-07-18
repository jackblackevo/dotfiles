# See /etc/zsh/zshrc
skip_global_compinit=1

export TERM=screen-256color

# https://www.freedesktop.org/software/systemd/man/file-hierarchy.html#Home%20Directory
export PATH="$HOME/.local/bin:$PATH"

export VISUAL=vim
export EDITOR="$VISUAL"

# Use agkozak/zsh-z instead of rupa/z for mrjohannchang/fz.sh
# https://github.com/changyuheng/fz.sh/issues/21#issuecomment-541839988
export FZ_HISTORY_CD_CMD=zshz

# https://github.com/lukechilds/zsh-nvm#auto-use
export NVM_AUTO_USE=true
