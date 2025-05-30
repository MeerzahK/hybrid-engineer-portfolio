#!/bin/bash

# Check for Homebrew and install if not present
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found, installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew 
echo "Updating Homebrew..."
brew update

# List of tools for local environment
declare -A tools=(
    ["Google Cloud CLI"]="brew install --cask google-cloud-sdk"
    ["Git"]="brew install git"
    ["Docker"]="brew install --cask docker"
    ["kubectl"]="brew install kubectl"
    ["Helm"]="brew install helm"
    ["tfenv"]="brew install tfenv"
    ["Java"]="brew install openjdk"
    ["AWS CLI"]="brew install awscli"
    ["SOPS"]="brew install sops"
)

# Check if tool is installed
check_and_install() {
    local tool_name=$1
    local install_cmd=$2
    if ! command -v "${tool_name,,}" &> /dev/null; then
        echo "Installing $tool_name..."
        eval $install_cmd
    else
        echo "$tool_name is already installed."
    fi
}

# Loop through the tools and install them
for tool in "${!tools[@]}"; do
    check_and_install "$tool" "${tools[$tool]}"
done

# Set up Google Cloud SDK if installed
if command -v gcloud &> /dev/null; then
    echo "Initializing Google Cloud SDK..."
    gcloud init
fi

# Docker initial setup
if open -Ra "Docker"; then
    echo "Initializing Docker..."
    open -a Docker
else
    echo "Docker application is not installed or could not be found."
fi

echo "All requested tools have been installed."
