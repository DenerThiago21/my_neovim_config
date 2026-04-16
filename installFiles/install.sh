#!/bin/bash

# Pre instalações
# ---------------------------------------
# Instalando o RUST
install_rust() {
	# Primeiro temos que instalar o Rust, que é uma dependencia para a instalação do treesitter
	echo "Installing Rust ..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source ~/.cargo/env
}

# Instalando o TREESITTER
install_treesitter() {
	# instalação do treesitter via cargo.
	echo "Installing Tree-sitter-cli ..."
	cargo install --locked tree-sitter-cli
}

# Instalando o NODEJS
install_node() {
	# para a instalação de alguns LSP é necessária a instalação do NodeJS
	echo "Installing nodejs ..."
	curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
	sudo apt install nodejs
	# npm install -g vscode-langservers-extracted
}

# Instalando o NEOVIM
install_neovim() {
	echo "Installing Neovim ..."
	
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	chmod u+x nvim-linux-x86_64.appimage
	./nvim-linux-x86_64.appimage

	mkdir -p /opt/nvim
	mv nvim-linux-x86_64.appimage /opt/nvim/nvim
	
#	sudo ln -sf /opt/nvim/nvim /usr/local/bin/nvim

	export PATH="$PATH:/opt/nvim/"
	source ~/.bashrc

	git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
}

# Instalando a configuração do NEOVIM
config_nvim() {
	echo "configuring neovim"

	git clone https://github.com/DenerThiago21/my_neovim_config.git "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim

	rm -rf "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
	cp -rf "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim   
	rm -rf "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim
}

echo "--------------My NeoVIM configuration-----------------"
install_rust
install_treesitter
install_node
install_neovim

config_nvim

nvim

echo "-----------------Finish installation------------------"

