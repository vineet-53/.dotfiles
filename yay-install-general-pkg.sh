#!/bin/zsh

# List of AUR packages (combined apt & snap package names) to install via yay
install_yay_pkg=(
  zsh 
  ani-cli 
  bat 
  copyq 
  curl 
  cmake 
  dunst 
  eza 
  feh 
  fzf 
  geary 
  git 
  gnome-tweaks 
  google-chrome  # Correct AUR name for Google Chrome
  kitty 
  luarocks 
  maim 
  picom 
  python-pip     # Correct AUR name for python3-pip
  ripgrep 
  stow 
  timeshift 
  tmux 
  vim-gtk3 
  clang 
  flex 
  gzip 
  bison           # Correct package for yacc
  make 
  xorg-xset       # Correct package for x11-xserver-utils

  # AUR snap-like packages
  firefox-bin     # AUR version of Firefox (binary)
  obs-studio      # AUR package for OBS Studio
  rnote-git       # AUR package for Rnote (latest git version)
  gimp            # AUR package for Gimp
)

# Update package list and install AUR packages via yay
echo "Updating package list and installing AUR packages using yay..."
yay -Syu --needed --noconfirm "${install_yay_pkg[@]}" || { echo "ERROR INSTALLING AUR PACKAGES"; exit 1; }

