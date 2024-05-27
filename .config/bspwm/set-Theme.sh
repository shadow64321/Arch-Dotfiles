#!/usr/bin/env bash

# Random Wallpaper
dirpapers='ls ~/.config/hypr/Wallpapers/*.jpg -1 | wc -l' &
paperseleted=$((1 + RANDOM % $dirpapers))
feh --bg-fill ~/.config/hypr/Wallpapers/$paperselected &
bash ~/.config/polybar/scripts/pywal.sh ~/.config/hypr/Wallpapers/$paperselected &
betterlockscreen -u ~/.config/hypr/Wallpapers/$paperselected &

# Solid Wallpaper - Get on my level hoe
#feh --bg-fill ~/.config/hypr/Wallpapers/'13.jpg' &
#bash ~/.config/polybar/scripts/pywal.sh ~/.config/hypr/Wallpapers/'13.jpg' &
