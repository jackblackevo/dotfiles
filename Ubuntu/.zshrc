# https://www.freedesktop.org/software/systemd/man/file-hierarchy.html#Home%20Directory
export PATH="$HOME/.local/bin:$PATH"

alias vim="nvim"
export VISUAL=vim
export EDITOR="$VISUAL"

# 開啟 Powerlevel9k 主題對 Nerd Fonts 字型的支援
POWERLEVEL9K_MODE='nerdfont-complete'

# 載入 Antigen
source /usr/share/zsh-antigen/antigen.zsh

# 透過 Antigen 來使用 Oh My Zsh
antigen use oh-my-zsh

# 透過 Antigen 載入 Oh My Zsh 內建 theme
# antigen theme robbyrussell

# 透過 Antigen 使用其他 Zsh theme
antigen theme bhilburn/powerlevel9k

# 透過 Antigen 使用 Oh My Zsh 內建 plug-ins
antigen bundle git
antigen bundle z

# 透過 Antigen 使用其他 Zsh plug-ins
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle Tarrasch/zsh-bd
antigen bundle changyuheng/zsh-interactive-cd
antigen bundle changyuheng/fz

# 套用 Antigen 設定
antigen apply

# 修改提示字顏色
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='$ '

# https://github.com/changyuheng/fz.sh/issues/21#issuecomment-541839988
FZ_HISTORY_CD_CMD=zshz

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
