#!/bin/bash

# Define the filename (you can modify this path)
FILE="$HOME/.config/hypr/hyprpaper.conf"

# Check if the file exists
if [ ! -e "$FILE" ]; then
  touch "$FILE"
fi

NEW_WALLPAPER="$1"
WALLPAPER_RELATIVE="${NEW_WALLPAPER/#$HOME/\$HOME}"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf" # Change this to your actual config file path

# Escape forward slashes for use in sed
ESCAPED_WALLPAPER=$(printf '%s\n' "$WALLPAPER_RELATIVE" | sed 's:/:\\/:g')

# Replace lines in the config file
sed -i "s|^preload = .*|preload = $ESCAPED_WALLPAPER|" "$CONFIG_FILE"
sed -i "s|^wallpaper = ,.*|wallpaper = ,$ESCAPED_WALLPAPER|" "$CONFIG_FILE"
