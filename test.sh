#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0;00m' # No Color

download_dotfiles() {
	# Actual dotfiles
    cd ~
    echo -e "${CYAN} Downloading dotfiles for vim, tmux ${NC}"
	mkdir test
    cd ~/test/
	git clone https://github.com/sbernheim4/dotfiles.git
	cd ~
}

# MAIN
$(download_dotfiles)
