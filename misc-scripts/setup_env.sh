#!/bin/bash

# ------- SSH Key for GitHub -------
# Define the function to create an SSH key
function performSetup() {
    echo "Creating an SSH key for you... 🔐"
    ssh-keygen -t rsa
}

# Check if a specific SSH key already exists
if [ -f "$HOME/.ssh/id_rsa" ]; then
    echo "SSH key already exists, skipping function."
else
# Call the function if the SSH key does not exist
    performSetup
fi

cat ~/.ssh/id_rsa.pub
sleep 3

priintf "Please add this public key to Github 👻 \n"
open -a Safari https://github.com/settings/keys
# shellcheck disable=SC2162
read -p "Press [Enter] key after this... ⌨️"
# ------- SSH Key for GitHub -------

# ------- Xcode -------
echo "Installing xcode-stuff 👨‍💻"
sudo xcode-select --install
# ------- Xcode -------


# ------- Homebrew -------

# Check if Homebrew is already installed
if command -v brew &>/dev/null; then
    echo "Homebrew is already installed."
fi

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Check installation status
if [ $? -eq 0 ]; then
    echo "Homebrew installation successful."
else
    echo "Failed to install Homebrew. Exiting."
    
fi
# ------- Homebrew Shell Env-------  
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

# Update homebrew recipes
echo "Updating homebrew... 🆕"
brew update
# ------- Homebrew -------

# ------- Git -------
echo "Installing Git... 🦸‍♂️"
brew install git

echo "Git config 🙋‍♂️ - Enter your data and press Enter!"

echo -n 'Username: '
read username
git config --global user.name "$username"

echo -n 'Mail: '
read mail
git config --global user.email $mail
# ------- Git -------

# ------- Terminal Setup -------

#Install Zsh & Oh My Zsh
# Define the function to install Oh My Zsh
if  [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed, skipping installation."
else
    
    echo "Installing Oh My ZSH... 😱"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi

#echo "Installing Oh My ZSH... 😱"
if  [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed, skipping installation."
else
curl -L http://install.ohmyz.sh | sh
echo "Setting up Oh My Zsh theme... 🎨"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

open ~/.zshrc
read -p "Please set ZSH_THEME=\"powerlevel10k/powerlevel10k\" ✍️ and then press Enter!"

echo "Add some auto suggestions... 👨‍🚒"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
open ~/.zshrc
read -p "Please add zsh-autosuggestions & zsh-syntax-highlighting to your Plugins! e. g. plugins=(... zsh-autosuggestions zsh-syntax-highlighting) (WITHOUT comma) ✍️ and then press Enter!"

fi

echo "Setting ZSH as shell... 💻"
chsh -s /usr/local/bin/zshd

# ------- Apps -------
echo "Installing homebrew cask 🧙‍♂️"
brew install homebrew/cask

apps=(
  alfred
  postman
  visual-studio-code
  spectacle
  sublime-text
  notion
  iterm2
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask... ⏳"
brew install --cask --appdir="/Applications" "${apps[@]}"

open /Applications/Alfred\ 5.app

# ------- Terminal Setup -------

echo "Cleaning up brew 🧹"
brew cleanup

echo "Setting up oh-my-zsh"
#open /Applications/iTerm.app

brew cleanup
# ------- Apps -------

# ------- Mac Settings -------
echo "Setting some Mac settings... ⚙️"

#"Automatically quit printer app once the print jobs complete 🖨"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Showing icons for hard drives, servers, and removable media on the desktop ℹ️"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default 💻"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

#"Preventing Time Machine from prompting to use new hard drives as backup volume 😫"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Setting screenshot format to PNG 📸"
defaults write com.apple.screencapture type -string "png"

killall Finder

