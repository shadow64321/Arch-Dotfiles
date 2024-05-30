#!/usr/bin/env bash

polybar='~/.config/polybar/Floating-Bar'

# Random Wallpaper
dirpapers='ls ~/.config/hypr/Wallpapers/*.jpg -1 | wc -l' &
paperseleted=$((1 + RANDOM % $dirpapers))
feh --bg-fill ~/.config/hypr/Wallpapers/$paperselected &
bash $polybar/scripts/pywal.sh ~/.config/hypr/Wallpapers/$paperselected &
betterlockscreen -u ~/.config/hypr/Wallpapers/$paperselected &

# Solid Wallpaper - Get on my level hoe
#feh --bg-fill ~/.config/hypr/Wallpapers/'13.jpg' &
#bash $polybar/scripts/pywal.sh ~/.config/hypr/Wallpapers/'13.jpg' &
