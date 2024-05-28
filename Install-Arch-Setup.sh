su root &

pacman -Syu &

# General Packages
pacman -S tar zsh steam vim neovim vlc network-manager-applet obs-studio syncthing rawtherapee gimp discord blanket lutris ffmpeg mpv aria2 tlp &

# BSPWM
pacman -S feh polybar picom bc python-pywal dmenu scrot brightnessctl rofi & # bspwm sddm sxhkd

# Terminal Stuff
pacman -S mpd wget p7zip alacritty bat gdu lf btop neofetch git starship zellij asciiquarium cmatrix cowsay lolcat figlet zoxide fzf &

# Programming Stuff
pacman -S gcc python cmake make &

# Infosec Stuff
pacman -S wireshark-cli okteta dhex nmap john &

# Fonts
pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-fira-code texlive-langkorean ttf-fantasque-nerd ttf-font-awesome

# Failed Fonts: hachimarupop, terminus-nerdfont, siji, material-icons

# Failed Packages: Anki, Floorp, Logseq, Mangal, musikcube, spotdl, libresprite, libreoffice, ascii-image-converter, cbonsai, bsp-layout, networkmanager_dmenu, betterlockscreen, gobuster, wordlists
# Opt Packages: Clang, Rustup, libime, ghidra

# Emulation Packages: qemu, virt-manager
