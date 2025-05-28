#!/bin/zsh

# Set installation directory
installDir=$HOME/personal
logs="$installDir/logs.txt"

# Print log function (append to file)
printLog(){ 
  echo "$1" >> "$logs"
}

# Section header function
section() {
  local msg="$1"
  local width=80
  local edge=$(printf '%*s' "$width" '' | tr ' ' '*')

  echo -e "\n\n\n$edge"
  echo "* $(printf '%s' "$msg" | sed "s/.*/ & /")"
  echo "$edge"
  echo -e "\n"
}

# Create directories and log file if they don't exist
section "PERSONAL"
if [ ! -d "$installDir" ]; then
    mkdir -p "$installDir"
    printLog "success: created personal directory"
fi

if [ ! -f "$logs" ]; then 
    touch "$logs"
    printLog "success: created logs.txt"
fi



# Install necessary packages
section "INSTALLING PACKAGES"
source $HOME/.dotfiles/apt-install-i3.sh

# Install Neovim
section "NEOVIM"
neovimInstallDir="$installDir/neovim/"
printLog "Cloning and installing Neovim binary..."
if [ ! -d "$neovimInstallDir" ]; then
  git clone https://github.com/neovim/neovim.git "$neovimInstallDir"
  cd "$neovimInstallDir"
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  printLog "success: installed Neovim"
else
   printLog "message: neovim already installed"
fi

# Link dotfiles using stow
section "DOTFILES"
printLog "Linking dotfiles using stow..."
dotfilesDIR="$HOME/.dotfiles"
if [ ! -d "$dotfilesDIR" ]; then 
  git clone "https://github.com/vineet-53/.dotfiles" "$dotfilesDIR" && printLog "success: cloned dotfiles"
else
  printLog "Dotfiles already cloned"
fi

cd $HOME/.dotfiles/
section "Linking dotfiles"
for dir in $(echo */); do
  stow "$dir" || printLog "error: linking $dir"
done
section "Ended Linking dotfiles"
cd $HOME

# Download wallpapers
section "WALLPAPERS"
wallpapersDIR="$HOME/Pictures/wallpapers"
if [ ! -d "$wallpapersDIR" ]; then
  printLog "Downloading wallpapers..."
  git clone --depth 1 https://github.com/JaKooLit/Wallpaper-Bank.git "$wallpapersDIR"
  mv "$wallpapersDIR/wallpapers"/* "$wallpapersDIR"
  rmdir "$wallpapersDIR/wallpapers" || printLog "error: could not remove subdir"
  rm -rf "$wallpapersDIR/.git"
  rm -rf "$wallpapersDIR/Dynamic-Wallpapers"
  printLog "success: wallpapers downloaded"
else
  printLog "Wallpapers already downloaded"
fi

# Install tmux plugins
section "TMUX"
if [ ! -d "$HOME/.tmux" ]; then
  printLog "Downloading tmux plugin manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  printLog "success: downloaded TPM"
  tmux new-session -d -s tmux-configuration "tmux source $HOME/.tmux.conf" C-m
  tmux attach -t tmux-configuration
else
  printLog "TPM already installed"
fi

# Install Oh My Zsh
section "OH MY ZSH"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  printLog "Downloading Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  printLog "success: installed Oh My Zsh"
else
  printLog "Oh My Zsh already installed"
fi

# GitHub SSH Setup
setupGithubSSH() {
  section "GITHUB"
  echo "Enter the SSH GitHub email address:"
  read mail
  printLog "Generating SSH key for GitHub..."
  ssh-keygen -t ed25519 -C "$mail"
  printLog "success: SSH key created"
  echo -e "\n\n"
  cat "$HOME/.ssh/id_ed25519.pub"
  printLog "SSH key generated. Copy it and add it to GitHub under Settings > SSH and GPG keys."
}

setupOnlineProfiles() {
  echo "!IMPORTANT: Login to GitHub to generate and add the SSH key."
  read -p "Do you want to proceed with setting up GitHub SSH? (Y/n): " answer
  if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    setupGithubSSH
  else
    printLog "Skipping GitHub SSH setup."
  fi
}

setupOnlineProfiles

