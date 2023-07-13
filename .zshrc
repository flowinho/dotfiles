
#
# ▒█▀▀▀ █░░ █▀▀█ █▀▀█ ░▀░ █▀▀█ █▀▀▄ 　 ▒█▀▀▀█ █▀▀ █░░█ █░░█ ▀▀█▀▀ ▀▀█▀▀ █░█ █▀▀█ █░░░█ █▀▀ █░█ ░▀░ 
# ▒█▀▀▀ █░░ █░░█ █▄▄▀ ▀█▀ █▄▄█ █░░█ 　 ░▀▀▀▄▄ █░░ █▀▀█ █░░█ ░░█░░ ░░█░░ █▀▄ █░░█ █▄█▄█ ▀▀█ █▀▄ ▀█▀ 
# ▒█░░░ ▀▀▀ ▀▀▀▀ ▀░▀▀ ▀▀▀ ▀░░▀ ▀░░▀ 　 ▒█▄▄▄█ ▀▀▀ ▀░░▀ ░▀▀▀ ░░▀░░ ░░▀░░ ▀░▀ ▀▀▀▀ ░▀░▀░ ▀▀▀ ▀░▀ ▀▀▀
#
#                          Copyright 2023 Florian Schuttkowski, Licensed GPL3
#                    For additional information, visit https://github.com/flowinho
#
# ======================%%========================%%==========================%%=====================

# ZSH specific configuration
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"

# Choosing powerline10k as base theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Load zsh configs and powerline10k configs
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add transfer.sh as zsh shell function to quickly use it
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

# Remap vim to nvim
alias vim='nvim'

# Remap ls to use exa
alias ls='exa --icons -la -l -h'

# Better git log, use -p to see changed lines
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# tar.gz + pigz Compression alias "best of all worlds"
alias compress='tar --use-compress-program="pigz --best --recursive | pv" -cf archive.tar.gz'

# macOS alias version of compress
if [[ $OSTYPE == darwin* ]]; then
    alias compress='tar --use-compress-program="pigz" -cf archive.tar.gz'
fi

# Compress using the above alias and pass file to gpg to encrypt it using a key.
# First parameter: Source file(s)
# Second parameter: Recipient key
alias compressEncrypt='e(){ tar --use-compress-program="pigz --best --recursive | pv -p -t -e" -cf - $1 | gpg -ear $2 > $1.tar.gz.gpg };e'

# GIT related aliassses
alias gFetch='git fetch && git branch -avv'
alias gUpdate='find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd && git fetch && git pull" \;'

# Fast directory switching
alias cdr='cd ~/Repositories'


# Add flutter to system path
export PATH="$PATH:$HOME/Flutter/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
