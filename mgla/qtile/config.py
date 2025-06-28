from typing import List
import os
import subprocess
from libqtile import bar, hook
from libqtile.config import Screen
from colors import colors
from keys import keys, mod, groups
from widgets import init_widgets
from layouts import init_layouts, floating_layout

screens = [
    Screen(
        top=bar.Bar(
            widgets=init_widgets(),
            size=26,
            margin=[4, 8, 0, 8],
            background=colors["background"],
            opacity=0.9,
        ),
    ),
]


layouts = init_layouts()

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
wmname = "LG3D"

@hook.subscribe.client_new
def set_floating_for_poe(window):
    wm_class = window.window.get_wm_class()
    name = window.name or ""

    if wm_class and ("steam_app_2694490" in wm_class or "Path of Exile" in name):
        window.floating = True
        window.togroup(qtile.current_group.name)
        window.cmd_bring_to_front()
