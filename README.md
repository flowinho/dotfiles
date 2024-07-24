# dotfiles

## Overview of the install script

This script automates the setup of a macOS environment by executing a series of commands to install essential tools and configurations. It is designed to streamline the installation of Homebrew, Oh My Zsh, Powerlevel10k theme, and various fonts, as well as symlink configuration files. **Note:** This script is a work in progress and might fail during execution.

## Prerequisites

- macOS operating system
- Internet connection for downloading necessary files

## Usage

To execute this script, follow these steps:

1. Open the Terminal application.
2. Ensure you have the necessary permissions to execute scripts:
   ```sh
   chmod +x install.sh
   ```
3. Run the script:
   ```sh
   ./install.sh
   ```

## Script Details

### Install Homebrew

Homebrew is a package manager for macOS that simplifies the installation of software. The script installs Homebrew using the official installation command.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Oh My Zsh

Oh My Zsh is a framework for managing Zsh configuration. The script installs Oh My Zsh using the official installation command.

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Copy Brewfile and Execute Brew Bundle

The script copies the `Brewfile-Work` to the home folder and uses `brew bundle install` to install the applications and dependencies listed in the Brewfile.

```sh
cp Brewfile-Work ~/Brewfile
brew bundle install
```

### Install Powerlevel10k Theme and Fonts

The script downloads the Powerlevel10k theme fonts and installs them by moving them to the system fonts directory.

```sh
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Regular.ttf
cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Bold.ttf
cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Italic.ttf
cp MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/MesloLGS%20NF%20Bold%20Italic.ttf
```

### Install Powerlevel10k using Oh My Zsh

The script clones the Powerlevel10k repository into the Oh My Zsh custom themes directory.

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Remove Existing Configurations

The script removes existing configuration files and directories to avoid conflicts with new configurations.

```sh
rm ~/.tmux.conf
rm ~/.zshrc
rm -rf ~/.config/kitty
rm -rf ~/.config/mc
rm -rf ~/.config/nvim
rm -rf ~/.config/btop
```

### Symlink Configuration Files

The script creates symbolic links to the new configuration files.

```sh
ln -s .tmux.conf ~/.tmux.conf
ln -s .zshrc ~/.zshrc
ln -s btop ~/.config/btop
ln -s kitty ~/.config/kitty
ln -s mc ~/.config/mc
ln -s nvim ~/.config/nvim
```

## Troubleshooting

If the script fails at any point, please review the error messages in the Terminal and ensure that:

- You have a stable internet connection.
- You have the necessary permissions to execute the script and install software.
- The paths to configuration files and directories are correct.

For further assistance, consult the documentation for the respective tools and frameworks used in this script.

## License

This project is licensed under the GPLv3 License. See the LICENSE file for details.
