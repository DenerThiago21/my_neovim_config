#!/bin/bash


git clone https://github.com/DenerThiago21/my_neovim_config.git "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim

rm -rf "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
cp -rf "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim   
rm -rf "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim