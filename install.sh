# Install script that executes necessary commands to setup my macOS environment
# This is work in progress and might fail!
#
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install oh-my-zshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy Brewfile to home-folder to execute brew bundle 
cp Brewfile-Work ~/Brewfile
brew bundle install

# Install powerline10k and fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Install Fonts by moving them to the library
cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Regular.ttf
cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Bold.ttf
cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Italic.ttf
cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Bold%20Italic.ttf

# Install powerline10k using oh-my-zshell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Remove existing configurations
rm ~/.tmux.conf
rm ~/.zshrc
rm -rf ~/.config/kitty
rm -rf ~/.config/mc
rm -rf ~/.config/nvim
rm -rf ~/.config/btop

# Symlink preferences
ln -s .tmux.conf ~/.tmux.conf
ln -s .zshrc ~/.zshrc
ln -s btop ~/.config/btop
ln -s kitty ~/.config/kitty
ln -s mc ~/.config/mc
ln -s nvim ~/.config/nvim

