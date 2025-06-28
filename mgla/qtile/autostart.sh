#!/bin/bash

# -- Tapeta tła
feh --bg-fill ~/.config/wallpapers/wallhaven-yj7rgl_3440x1440.png &

# -- Picom z rozmyciem (blur)
picom --config ~/.config/picom/picom.conf &

# -- Ładowanie ustawień NVIDIA (np. 100Hz)
nvidia-settings --load-config-only &

# -- Monitor 100Hz — jeśli nie używasz pliku Xorg
 xrandr --output DP-2 --mode 3440x1440 --rate 100 &

# -- Ustawienie prędkości kursora (Razer)
xinput --set-prop 15 "Razer Razer DeathAdder V2 X HyperSpeed" "libinput Accel Speed" -0.5 &

# -- Powiadomienia (jeśli używasz dunst)
dunst &

# -- Flameshot (screenshoty)
flameshot &

# -- Aplet sieciowy (jeśli chcesz GUI do Wi-Fi)
(sleep 2 && nm-applet) &

# -- Aplet dźwięku (ikona do głośności w trayu)
(sleep 3 && pasystray) &


# -- Zmiana motywu na dzień/noc (jeśli robisz skrypt set_theme.sh)
 ~/.config/qtile/set_theme.sh &
