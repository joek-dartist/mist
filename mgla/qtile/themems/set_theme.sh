#!/bin/bash

hour=$(date +"%H")

if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
    cp ~/.config/qtile/themes/colors_day.py ~/.config/qtile/colors.py
else
    cp ~/.config/qtile/themes/colors_night.py ~/.config/qtile/colors.py
fi

qtile cmd-obj -o cmd -f reload_config
