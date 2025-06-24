#!/bin/bash 

DOTFILES=$HOME/dotfiles


NVIDIA_PKGS=(
  nvidia-dkms 
  nvidia-utils 
  lib32-nvidia-utils
  libva-nvidia-driver
)

BASIC_PKGS=(
    tldr
    base-devel 
    archlinux-keyring
    git 
    vim 
    git 
    neovim 
    cmake 
    gedit
    nodejs-lts-jod 
)

FONTS=( 
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    otf-font-awesome
    ttf-droid
    ttf-fira-code
    ttf-cascadia-code
    ttf-meslo-nerd
)

HYPR_PKGS=(
    hyprland
    hyprpaper
    hyprlock
    hypridle
    hyprpicker
    egl-wayland
    lib32-nvidia-utils
    grimblast
    pipewire                                               # audio/video server
    pipewire-alsa                                          # pipewire alsa client
    pipewire-audio                                         # pipewire audio client
    pipewire-jack                                          # pipewire jack client
    pipewire-pulse                                         # pipewire pulseaudio client
    gst-plugin-pipewire                                    # pipewire gstreamer client
    wireplumber                                            # pipewire session manager
    pavucontrol                                            # pulseaudio volume control
    pamixer                                                # pulseaudio cli mixer
    networkmanager                                         # network manager
    network-manager-applet                                 # network manager system tray utility
    bluez                                                  # bluetooth protocol stack
    bluez-utils                                            # bluetooth utility cli
    blueman                                                # bluetooth manager gui
    brightnessctl                                          # screen brightness control
    playerctl                                              # media controls
    udiskie                                                # manage removable media
    btop
    rofi-wayland                                          
    wofi 
    wofi-calc
    wofi-emoji
    waybar                                               
    swww                                                
    wlogout                                           
    grim                                             
    slurp                                          
    satty                                         
    cliphist                                     
    wl-clip-persist                             
    bat 
    polkit-gnome
    xdg-desktop-portal-hyprland                   
    xdg-user-dirs                              
    pacman-contrib                                         
    parallel                                              
    jq                                                   
    imagemagick                                         
    qt5-imageformats                                   
    ffmpegthumbs                                      
    libnotify                                       
    nwg-look                                              
    qt5ct                                                  
    qt6ct
    qt5-wayland                                           
    qt6-wayland                                            
    eza 
    zsh 
    fastfetch
    nwg-bar 
)


CUSTOM_PKGS=(
    catppuccin-cursors-mocha
    catpuccin-gtk-mocha
    # catpuccin-kvantum
    curl
    luarocks
    fd
    yt-dlp
    papirus-icon-theme
    papirus-folders
    flex 
    bison 
    lazygit
    tmux 
    ghostty 
    kitty
    libinput-gestures
    power-profiles-daemon                                
    xdg-desktop-portal-gtk                                 
    wf-recorder                                          
    emote                                               
    cava                                                   
    spotify                                               
    spicetify-cli                                        
    neovim
    visual-studio-code-bin                               
    electron                                              
    vlc 
    mpv 
    ani-cli 
    telegram-desktop 
    thunderbird
    gvim 
    nwg-displays
    fzf 
    ripgrep
    unzip 
    rnote
    kitty

)

check_and_install() {
    local pkg="$1"

    if [[ -z "$pkg" ]]; then
        echo "Usage: check_and_install <package-name>"
        return 1
    fi

    # Ensure yay is available
    if ! command -v yay &>/dev/null; then
        echo "Error: 'yay' is not installed. Please install yay first."
        return 2
    fi

    # Check if the package is already installed
    if pacman -Q "$pkg" &>/dev/null; then
        echo "Package '$pkg' is already installed."
        return 0
    fi

    echo "Package '$pkg' is not installed. Checking availability..."

    # Check if the package exists in the official repos
    if pacman -Si "$pkg" &>/dev/null; then
        echo "Installing '$pkg' from official repos using pacman..."
        sudo pacman -S --noconfirm "$pkg"
    else
        echo "'$pkg' not found in pacman. Trying AUR with yay..."
        yay -S --noconfirm "$pkg"
    fi
}


install_dotfiles() {
    cd $HOME 
    if [[ ! -d "$DOTFILES" ]]; then
        git clone https://github.com/vineet-53/.dotfiles "$DOTFILES"
    fi

    cd "$DOTFILES"

    check_and_install stow  

    for item in */; do
        dir="${item%/}"  # Remove trailing slash
        stow "$dir" > /dev/null || echo "Error linking $dir"
    done

    cd $HOME
}

ask(){ 
  read -p "Install $1 ? : (y/n) => " res 
  if [[ $res = 'y' ]]; then 
    $2
  fi 
}

install_hyprland() { 
    for item in "${HYPR_PKGS[@]}"; do 
        check_and_install $item 
    done 
}

install_fonts() { 
    for item in "${FONTS[@]}"; do 
        check_and_install "$item"
    done 
} 

install_custom_pkgs() { 
    for item in "${CUSTOM_PKGS[@]}"; do 
        check_and_install $item
    done 
} 

brave_install() { 
  curl -fsS https://dl.brave.com/install.sh | sh
}


basic_pkgs_install() { 
    echo "UPDATING SYSTEM ...."
    yay -Syu 
    echo "INSTALLING BASIC PACKAGES" 
    for item in "${BASIC_PKGS[@]}"; do 
        check_and_install "$item" 
    done 
}

install_nvidia(){  
    check_and_install gedit
    echo "Enable Multilib repository"
    echo "Uncomment [multilib] Include = /etc/pacman.d/mirrorlist"
    sudo gedit /etc/pacman.conf
    echo "UPDATING SYSTEM" 
    yay -Syu 

    echo "INSTALLING NVIDIA DKMS DRIVERS...."

    for item in "${NVIDIA_PKGS[@]}"; do 
      check_and_install "$item" 
    done 

    echo "READ AND APPLY: "
    xdg-open https://github.com/korvahannu/arch-nvidia-drivers-installation-guide
    tmux 
}

install_yay() { 
    echo "Installing YAY manager..." 
    cd ~
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $HOME 
    echo "UPDATING SYSTEM ...."
    yay -Syu 
    echo "INSTALLING REQUIRED PACKAGES" 
    basic_pkgs_install
    echo "INSTALLING LINUX HEADERS" 
    sudo pacman -S linux-headers
}

install_zsh() {
    cd "$HOME"
    check_and_install zsh

    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        # After install, ensure we're in the right place

    else
        echo "Oh My Zsh already installed. Skipping install."
    fi
    cd "$HOME/.oh-my-zsh/plugins"
    [[ ! -d "zsh-syntax-highlighting" ]] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    [[ ! -d "zsh-autocomplete" ]] && git clone https://github.com/marlonrichert/zsh-autocomplete.git
    [[ ! -d "zsh-autosuggestions" ]] && git clone https://github.com/zsh-users/zsh-autosuggestions.git
    source ~/.zshrc
    echo -e "DONE INSTALLING ZSH"
    cd "$HOME"
}

source_config_files() {
  cd $HOME
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
    tmux new-session -d -s tmux-source
    tmux send-keys -t tmux-source 'tmux source ~/.tmux.conf' C-m 
    tmux kill-server
  cd $HOME 
} 

generate_ssh () { 
  while true; do 
    read -p "enter email => " email
    if [[ $email ]]; then 
      break; 
    fi 
  done
  if [[ ! $email ]]; then return 0; fi 
  read -p "enter user.name or username" name 
  git config --global user.name "$name" 
  git config --global user.email "$email" 
  ssh-keygen -t ed25519 -C "$email"
  cat ~/.ssh/id_ed25519.pub | wl-copy
  echo "Paste the key in : => " 
  xdg-open "https://github.com/settings/keys"
} 

setup_theme () { 
    [[ ! -d "$HOME/.themes/Nordic/" ]] && git clone https://github.com/EliverLara/Nordic.git ~/.themes/Nordic
    echo "done installing theme" 
    nwg-look
    papirus-folders -C blue
}

install_node() { 
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source ~/.zshrc
  nvm install 22
}

#install_yay 
#install_fonts 
#install_zsh 
install_custom_pkgs
#install_hyprland 
#install_dotfiles
#source_config_files
# generate_ssh
# install_node


#setup_theme 
