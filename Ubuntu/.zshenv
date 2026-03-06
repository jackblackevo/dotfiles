# Prevent Ubuntu's /etc/zsh/zshrc from calling compinit, as zimfw/completion
# manages compinit instead
# See:
# - /etc/zsh/zshrc
# - https://github.com/zimfw/completion
# - https://github.com/zimfw/install/blob/55a2a28dfef53b9a12a16e38279f662363229c69/install.zsh#L125-L127
skip_global_compinit=1

export VISUAL=vim
export EDITOR="$VISUAL"
