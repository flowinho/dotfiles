export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias gUpdate='find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && git fetch && git pull" \;'
alias gPrepareForBackup='find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && rm -rf .git" \;'
alias ls='eza --grid --icons=auto --all --group-directories-first' 
alias vim='nvim' 
alias tree='eza --tree --icons=auto --all'
alias decompress='unpigz'
alias compress='tar --use-compress-program="pigz -k -9" -cvf'
alias untar='tar -xvf'
alias fzf='fzf --preview "bat --color=always --line-range :50 {}"'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
