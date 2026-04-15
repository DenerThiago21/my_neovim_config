#!/bin/bash

# Primeiro temos que instalar o Rust, que é uma dependencia para a instalação do treesitter
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

# instalação do treesitter via cargo.
cargo install --locked tree-sitter-cli

# para a instalação de alguns LSP é necessária a instalação do NodeJS
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs
# npm install -g vscode-langservers-extracted
