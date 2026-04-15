#!/bin/bash

echo "Installing Neovim ..."

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage

mkdir -p /opt/nvim
mv nvim-linux-x86_64.appimage /opt/nvim/nvim

export PATH="$PATH:/opt/nvim/"

git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

nvim

