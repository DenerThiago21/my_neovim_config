#!/bin/bash

fonts_dir="${HOME}/.local/share/fonts"
url="https://github.com/ryanoasis/nerd-fonts/releases/download"
version="v3.2.1"

install_font() {
	echo = "Typing the font name ..."
	read font
	
	temp_dir="${fonts_dir}/temp"
	mkdir -p "$temp_dir"

	zip_file="${font}.zip"
	download_url="${url}/${version}/${zip_file}"
	zip_path="${temp_dir}/${zip_file}"

	echo "Donwloading ${font} ..."
	wget -O "$zip_path" "$download_url"


	unzip_install

	cd "$temp_dir"
	unzip "$zip_file"
	rm "$zip_file"

	find . -name "*.ttf" -o -name "*.otf" | xargs -I {} mv {} "$fonts_dir/"
	rm -rf "$temp_dir"
}

unzip_install() {
	local pacote="unzip"

	if ! dpkg -l "$pacote" 2>/dev/null | grep -q "^ii"; then
		echo "installing unzip ..."
		sudo apt install "$pacote"
	fi
}


if ! test -d fonts_dir; then
	mkdir -p "$fonts_dir"
fi
	
install_font

fc-cache -fv

