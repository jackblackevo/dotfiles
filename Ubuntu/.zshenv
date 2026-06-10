# Prevent Ubuntu's /etc/zsh/zshrc from calling compinit, as zimfw/completion
# manages compinit instead
# See:
# - /etc/zsh/zshrc
# - https://github.com/zimfw/completion
# - https://github.com/zimfw/install/blob/55a2a28dfef53b9a12a16e38279f662363229c69/install.zsh#L125-L127
skip_global_compinit=1

export VISUAL=vim
export EDITOR="$VISUAL"

# Keep only the first occurrence of each PATH entry on every assignment,
# so nested login shells (e.g. tmux windows) re-running the ~/.zprofile
# prepend do not accumulate duplicates
# See:
# - man zshbuiltins (typeset -U)
# - https://wiki.archlinux.org/title/Zsh#Configuring_$PATH
typeset -U PATH path

# Use the systemd-managed ssh-agent (socket activation, shipped with Ubuntu's
# openssh-client), so keys added by ssh-add (see ~/.zshrc) or AddKeysToAgent
# (see ~/.ssh/config) are cached across shell sessions until WSL shuts down.
# Keep SSH_AUTH_SOCK untouched when already set (e.g. ssh agent forwarding).
# See:
# - /usr/lib/systemd/user/ssh-agent.socket
# - https://man.openbsd.org/ssh_config.5#AddKeysToAgent
if [[ -z "$SSH_AUTH_SOCK" && -S "${XDG_RUNTIME_DIR:-/run/user/$UID}/openssh_agent" ]]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-/run/user/$UID}/openssh_agent"
fi
