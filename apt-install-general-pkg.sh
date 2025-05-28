#!/bin/zsh

# List of packages to install via apt
install_apt_pkg=(
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
  google-chrome-stable 
  kitty 
  luarocks 
  maim 
  picom 
  python3-pip 
  python3-pynvim 
  ripgrep 
  stow 
  timeshift 
  tmux 
  vim-gtk3 
  clangd 
  flex 
  gzip 
  yacc 
  make 
  x11-xserver-utils
)

install_snap_pkg=(
firefox 
obs-studio 
rnote 
gimp
)

# Update package list and install packages via apt
sudo apt update
sudo apt install -y "${install_apt_pkg[@]}" || { echo "ERROR INSTALLING APT PACKAGES"; exit 1; }

# Install snap packages
sudo snap install "${install_snap_pkg[@]}" || echo "ERROR INSTALLING SNAP PACKAGE"

