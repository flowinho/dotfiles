# This script will create directories as necessary
# and create symlinks as necessary.
# What is needed to make this script work?
# - All Repositories should be in ~/Repositories (this is what is asssumed).
#
echo "Linking brewfile and running brew"
echo "Checking for brew,..."
if ! command -v brew &> /dev/null
then
	echo "Homebrew not found! Exiting."
	exit
fi

echo "Linking brewfile from repository"
ln -s ~/Repositories/dotfiles/Brewfile ~/Brewfile
brew bundle install


echo "Initial check if all required programs are installed... (this could fail on macOS)"

if ! command -v mc &> /dev/null
then
    echo "Midnight Commandar could not be found! Exiting."
    exit
fi

if ! command -v nvim &> /dev/null
then
    echo "NeoVim could not be found! Exiting."
    exit
fi

echo "Linking the config files"

echo "Linking powershell10k config"
FILE=~/.p10k.zsh
if [[ -f "$FILE" ]]; then
    echo "$FILE exists -- backing up, please delete manually."
	mv "$FILE" "$FILE.BAK"
fi
ln -s ~/Repositories/dotfiles/.p10k.zsh ~/.p10k.zsh
echo "-- Done"

echo "Linking zshell"
FILE=~/.zshrc
if [[ -f "$FILE" ]]; then
    echo "$FILE exists -- backing up, please delete manually."
	mv "$FILE" "$FILE.BAK"
fi
ln -s ~/Repositories/dotfiles/.zshrc ~/.zshrc
echo "-- Done"

echo "Linking Midnight Commander config"
mkdir -p ~/.config/
DIR="~/.config/mc"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "$DIR already exists -- backing up, please delete manually."
  mv "$DIR" "$DIR_BAK"
fi
ln -s ~/Repositories/dotfiles/mc ~/.config/mc
echo "-- Done"

echo "Linking Midnight Commander theme"
mkdir -p ~/.local/share/mc/skins
ln -s ~/Repositories/dotfiles/mc/dracula.ini ~/.local/share/mc/skins/dracula.ini
ln -s ~/Repositories/dotfiles/mc/dracula256.ini ~/.local/share/mc/skins/dracula256.ini
echo "-- Done"

echo "Linking kitty config"
mkdir -p ~/.config/
DIR="~/.config/kitty"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "$DIR already exists -- backing up, please delete manually."
  mv "$DIR" "$DIR_BAK"
fi
ln -s ~/Repositories/dotfiles/kitty ~/.config/kitty
echo "-- Done"

echo "Linking Midnight Commander skin"
mkdir -p ~/.local/share/mc/skins
FILE=~/.local/share/mc/skins/dracula.ini
if [[ -f "$FILE" ]]; then
    echo "$FILE exists -- backing up, please delete manually."
	mv "$FILE" "$FILE.BAK"
fi
ln -s ~/Repositories/dotfiles/mc/dracula.ini ~/.local/share/mc/skins/dracula.ini
echo "-- Done"

echo "Linking NeoVim Config"
mkdir -p ~/.config/nvim
FILE=~/.config/nvim/init.vim
if [[ -f "$FILE" ]]; then
    echo "$FILE exists -- backing up, please delete manually."
	mv "$FILE" "$FILE.BAK"
fi
ln -s ~/Repositories/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
echo "-- Done"
