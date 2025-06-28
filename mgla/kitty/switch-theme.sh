#!/bin/bash
hour=$(date +%H)
kitty_conf="$HOME/.config/kitty/kitty.conf"

if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
  sed -i 's|include themes/.*|include themes/gruvbox_light.conf|' "$kitty_conf"
else
  sed -i 's|include themes/.*|include themes/gruvbox_dark.conf|' "$kitty_conf"
fi

sed -i "s|include themes/.*|include themes/$theme|" "$kitty_conf"
