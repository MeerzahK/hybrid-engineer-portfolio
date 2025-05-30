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
sleep 5 

echo "Please add this public key to Github 👻 \n"
open -a Safari https://github.com/settings/keys
read -p "Press [Enter] key after this... ⌨️"
# ------- SSH Key for GitHub -------

# ------- Xcode -------
echo "Installing xcode-stuff 👨‍💻"
sudo xcode-select --install
# ------- Xcode -------


# ------- Homebrew -------
# Check for Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  echo "Installing homebrew... 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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
git config --global user.email "$mail"
# ------- Git -------

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
  warp
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

# ------- Apps -------

# ------- Mac Settings -------
echo "Setting some Mac settings... ⚙️"

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

# ------- Mac Settings -------

killall Finder

