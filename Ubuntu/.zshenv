# Prevent Ubuntu's /etc/zsh/zshrc from calling compinit, as zimfw/completion
# manages compinit instead
# See:
# - /etc/zsh/zshrc
# - https://github.com/zimfw/completion
skip_global_compinit=1

export VISUAL=vim
export EDITOR="$VISUAL"
