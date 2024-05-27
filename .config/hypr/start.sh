#!/usr/bin/env bash

swww init &
swww img Wallpapers/Fireblade.jpg &

nm-applet --indicator &

# bash ~/.config/polybar/scripts/pywal.sh ~/.config/hypr/Wallpapers/Fireblade.jpg &

waybar &

syncthing &

# pypr &

dunst
