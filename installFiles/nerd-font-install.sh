#!/bin/bash

fonts_dir="${HOME}/.local/share/fonts"
url="https://github.com/ryanoasis/nerd-fonts/releases/download"
version="v3.2.1"

install_font() {
	echo = "Typing the font name ..."
	read font
	wget -O "$fonts_dir" "${url}/${version}/${font}.zip"

	unzip_install

	cd "${fonts_dir}"
		
	unzip "${font}.zip"

	rm "${font}.zip"
}

unzip_install() {
	local pacote="unzip"

	if ! dpkg -l "${pacote}" 2>/dev/null | grep -q "^ii"; then
		echo "installing unzip ..."
		sudo apt install "${pacote}"
	fi
}


if ! test -d fonts_dir; then
	mkdir -p "$fonts_dir"
fi
	
install_font

fc-cache -fv

