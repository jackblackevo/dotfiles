# Keep only the first occurrence of each PATH entry on every assignment,
# so nested login shells (e.g. tmux windows) re-running the prepends
# below do not accumulate duplicates
# See:
# - man zshbuiltins (typeset -U)
# - https://wiki.archlinux.org/title/Zsh#Configuring_$PATH
typeset -U PATH path

# Add Homebrew to PATH
# See: https://github.com/Homebrew/install/blob/main/install.sh#L1072-L1118
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# PATH: colon-separated list of directories to search for executables
# $HOME: current user's home directory (e.g. /Users/username)
# $HOME/.local/bin: user-specific executable directory (no root required)
export PATH="$HOME/.local/bin:$PATH"
