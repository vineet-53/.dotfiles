!#/bin/bash
# Install required packages
# sudo apt install nodejs cmake git vim-gtk3 tmux clangd flex yacc stow 
#
source $HOME/.dotfiles/apt-install-general-pkg.sh

# install packages 
# install npm 
# install neovim 
# link stow dotfiles 
# open neovim and install lazy lua plugins 
# download wallpapers move to the pictures 
# install tmux plugins 
# setup profile on chrome, geary, firefox 
# setup github 

# yay -S yazi

# Set installation directory
installDir=$HOME/personal
logs="$installDir/logs.txt"

printLog(){ 
  echo "$1" > "$logs"
}

section() {
  local msg="$1"
  local width=80
  local edge=$(printf '%*s' "$width" '' | tr ' ' '*')

  echo -e "\n\n\n$edge"
  echo "* $(printf '%s' "$msg" | sed "s/.*/ & /")"
  echo "$edge"
  echo -e "\n"
}

section "PERSONAL"
# Check if the directory exists, create it if it doesn't
if [ ! -d "$installDir" ]; then
    mkdir "$installDir"
    printLog "success: created personal directory"
fi

if [ ! -f "$logs" ]; then 
    touch "$installDir/logs.txt"
    printLog "success: created logs.txt"
fi

# Install Neovim

section "NEOVIM"
printLog "cloning neovim binary...."
if git clone https://github.com/neovim/neovim.git "$installDir/neovim"; then 
  cd "$installDir/neovim"
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  printLog "success: installed neovim binary"
else 
  printLog "error: cloning neovim"
fi



# Linking dotfiles

section "DOTFILES"
printLog "linking all configs using stow"

dotfilesDIR=$HOME/.dotfiles
if [ ! -d "$dotfilesDIR" ]; then 
  if git clone "https://github.com/vineet-53/.dotfiles" $HOME/.dotfiles; then 
    printLog "success: cloning dotfiles"
    section "Linking dotfiles"
    for dir in $(echo */); do 
        stow "$dir" || printLog "error: linking $dir"
    done
    section "Ended Linking dotfiles"
  else 
    printLog "error: cloning dotfiles" 
  fi 
fi


section "WALLPAPERS" 
wallpapersDIR=$HOME/Pictures/wallpapers
if [ ! -d "$wallpapersDIR" ]; then 
  printLog "downloading wallpapers .... "
  if git clone --depth 1 https://github.com/JaKooLit/Wallpaper-Bank.git $HOME/Pictures/wallpapers; then 
    mv "$wallpapersDIR/wallpapers/*" "$wallpapersDIR" 
    rmdir "$wallpapersDIR/wallpapers"
    rm -rf "$wallpapersDIR/.git"
    rm -rf "$wallpapersDIR/Dynamic-Wallpapers"
    printLog "success: downloaded wallpapers DIR: $(ll | grep wallpapers)"
  else 
    printLog "error: cloning wallpapers"
  fi
fi


section "TMUX"
if [ ! -d "$HOME/.tmux" ]; then 
  printLog "downloading tpm..."
  if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then  
    printLog "success: downloaded tpm" 
    tmux new-session -d -s tmux-configuration "tmux source $HOME/.tmux.conf && nvim $HOME/.tmux.conf && tmux source $HOME/.tmux.conf" C-m
    tmux attach -t tmux-configuration
  else 
    printLog "error: downloading tpm "
  fi
fi


section "OH_MY_ZSH"
if [ ! -d "$HOME/.oh-my-zsh" ]; then 
  printLog "downloading oh-my-zsh"
  if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then 
    printLog "success: downloaded oh-my-zsh" 
  else 
    printLog "error: downloading oh-my-zsh"
  fi
fi

setupOnlineProfiles() { 
  echo "!IMPORTANT Login to GitHub for generating and adding SSH key"
  read -p "Do you want to proceed? (Y/n): " answer
  if [[ "$answer" == "y" || "$answer" == "Y" ]]; then 
    setupGithubSSH
  elif [[ "$answer" == "n" || "$answer" == "N" ]]; then
    echo "Skipping GitHub SSH setup"
  else 
    echo "Invalid input, assuming yes..."
    setupGithubSSH
  fi
}

setupGithubSSH() { 
  section "GITHUB"
  echo "Enter the ssh github mail" 
  read mail 
  printLog "creating ssh key..."
  ssh-keygen -t ed25519 -C "$mail"
  printLog "success: created ssh key"
  echo -e "\n\n"
  cat $HOME/.ssh/id_ed25519.pub 
  echo -e "\n\n"
}

setupOnlineProfiles
