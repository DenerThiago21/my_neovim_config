#!/bin/bash

fonts_dir="${HOME}/.local/share/fonts"
url="https://github.com/ryanoasis/ner-fonts/releases/donwload"
version="v3.2.1"

install_font() {
	echo = "Typing the font name ..."
	read font
	wget "${url}/${version}/${font}.zip"

	unzip_install
		
	unzip -o "${font}.zip" -d "$fonts_dir"
	rm "${font}.zip"

}

unzip_install() {
	local pacote="unzip"

	if ! dpkg -l "$pacote" 2>/dev/null | grep -q "^ii"; then
		echo "installing unzip ..."
		sudo apt install "$pacote"
	if
}


if ! test -d fonts_dir; then
	mkdir -p "$fonts_dir"
else
	
install_font

fc-cache -fv

