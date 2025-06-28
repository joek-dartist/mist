from libqtile.config import Key, Group
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty"

groups = [
    Group("🎮", layout="max"),
    Group("🎨", layout="columns"),
    Group("🧠", layout="monadtall"),
    Group("🌐", layout="columns"),
    Group("⚙️", layout="monadtall"),
    Group("🎵", layout="floating"),
    Group("📁", layout="columns"),
    Group("💬", layout="monadtall"),
    Group("🍵", layout="floating")
]

keys = [
     Key([mod], "Return", lazy.spawn(terminal), desc="Uruchom terminal"),
     Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Launcher"),

    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod, "shift"], "space", lazy.layout.previous()),

    # Głośność
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),
    Key([mod], "p", lazy.spawn("/usr/bin/pavucontrol"), desc="Otwórz pavucontrol"),

    # Screenshoty
    Key([mod], "s", lazy.spawn("flameshot gui")),

    Key([mod], "h", lazy.layout.left()),     # W lewo
    Key([mod], "l", lazy.layout.right()),    # W prawo
    Key([mod], "j", lazy.layout.down()),     # W dół
    Key([mod], "k", lazy.layout.up()),       # W górę
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod], "n", lazy.layout.normalize()),

]

for i, group in enumerate(groups):
    index = str(i + 1)
    keys.extend([
        Key([mod], index, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], index, lazy.window.togroup(group.name))
    ])
