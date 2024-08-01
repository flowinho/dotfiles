export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias gitPrepareForBackup='find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && rm -rf .git" \;'
alias ls='eza --icons=auto --all --group-directories-first' 
alias vim='nvim' 
alias tree='eza --tree --icons=auto --all'
alias decompress='unpigz'
alias compress='tar --use-compress-program="pigz -k -9" -cvf'
alias untar='tar -xvf'
alias fzf='fzf --preview "bat --color=always --line-range :50 {}"'

# zsh functions
function gitUpdateAll() {
  for dir in $(find . -type d -name ".git" | sed "s/\/.git//"); do
    echo "Updating $dir"
    (cd $dir && git fetch && git pull)
  done
}

# ChatGPT
alias gpt='openai api chat.completions.create -m gpt-4o -g user'

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh                                                                            │
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh >> ~/.zshrc
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /opt/homebrew/share/forgit/forgit.plugin.zsh ] && source /opt/homebrew/share/forgit/forgit.plugin.zsh
