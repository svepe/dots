#!/bin/bash

# Install dependencies
sudo apt-get install ripgrep fd-find

# Download nvim
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# Install binary
sudo mv $(pwd)/nvim.appimage /usr/bin/nvim

# Point vim to nvim
sudo ln -s /usr/bin/nvim /usr/bin/vim

# Install config
ln -s $(pwd)/nvim $HOME/.config/nvim
