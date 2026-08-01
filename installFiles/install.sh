#!/bin/bash

# Interrompe o script se qualquer comando falhar
set -e

# Pre instalações
# ---------------------------------------
# Instalando o RUST
install_rust() {
	# Primeiro temos que instalar o Rust, que é uma dependencia para a instalação do treesitter
	echo "Installing Rust ..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	#source $HOME/.cargo/env

	# CORREÇÃO: Define o PATH diretamente no script para o restante da execução reconhecer o cargo
	export PATH="$HOME/.cargo/bin:$PATH"
}

# Instalando o TREESITTER
install_treesitter() {
	# instalação do treesitter via cargo.
	echo "Installing Tree-sitter-cli ..."
	# Talvez tenha que instalar o clang
	sudo apt install llvm-dev libclang-dev clang
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

#	mkdir -p /opt/nvim
#	mv nvim-linux-x86_64.appimage /opt/nvim/nvim
	
#	sudo ln -sf /opt/nvim/nvim /usr/local/bin/nvim

#	export PATH="$PATH:/opt/nvim/"
#	source ~/.bashrc
	
	./nvim-linux-x86_64.appimage --appimage-extract
	./squashfs-root/AppRun --version

	sudo mv squashfs-root /
	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

	nvim
	

	git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

	nvim
}

# Instalando a configuração do NEOVIM
config_nvim() {
	echo "configuring neovim"

	git clone https://github.com/DenerThiago21/my_neovim_config.git "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim

	rm -rf "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
	cp -rf "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim   
	rm -rf "${XDG_CONFIG_HOME:-$HOME/Downloads}"/nvim
}

# Instalando o ripgrep
install_ripgrep() {
	sudo apt install ripgrep	
}

echo "--------------My NeoVIM configuration-----------------"
install_rust
install_treesitter
install_node
install_neovim
config_nvim
install_ripgrep
nvim

echo "-----------------Finish installation------------------"

