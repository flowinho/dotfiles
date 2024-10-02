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
alias compressUltra='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'

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


# Herd injected NVM configuration
export NVM_DIR="/Users/flowinho/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP binary.
export PATH="/Users/flowinho/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/flowinho/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/flowinho/Library/Application Support/Herd/config/php/84/"
