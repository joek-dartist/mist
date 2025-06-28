from libqtile import widget
import subprocess
from colors import colors
from libqtile import qtile
from libqtile import bar

def init_widgets():
    return [

        # Runa – dekoracja / separator
        widget.TextBox(
            text='ᛉ',
            fontsize=22,
            padding=10,
            foreground='#d79921'
        ),

        # Układ okien (Monad, Max itp.)
        widget.CurrentLayout(
            foreground=colors["accent"],
            background=colors["background"],
            padding=6,
        ),

        # Grupy – z aktywnym podświetleniem
        widget.GroupBox(
            highlight_method='text',
            active=colors["foreground"],
            inactive=colors["inactive"],
            this_current_screen_border=colors["accent"],
            padding=5,
            font='JetBrainsMono Nerd Font'
        ),

        # Nazwa okna
        widget.WindowName(
            foreground=colors["active"],
            background=colors["background"],
            padding=8,
        ),


            widget.Spacer(length=bar.STRETCH),
        # ⏰ Zegar
            widget.Clock(
            format='🕰 %a %d %b %H:%M',
            foreground=colors["accent"],
            background=colors["background"],
            padding=8,
        ),


        # 🌕 Faza księżyca (prosta wersja)
        widget.GenPollText(
            update_interval=3600,
            func=lambda: subprocess.check_output(["sh", "-c", "curl -s wttr.in/?format=%m"]).decode("utf-8").strip(),
            foreground=colors["moon"],
            background=colors["background"],
            padding=8,
        ),

         # Pogoda
         widget.GenPollText(
    update_interval=1800,  # co 30 min
    func=lambda: subprocess.check_output(
        ["sh", "-c", "curl -s wttr.in/Pyskowice?format=1"]
    ).decode("utf-8").strip(),
    foreground=colors["accent"],
    background=colors["background"],
    padding=8,
),
widget.Spacer(length=bar.STRETCH),
       #  CPU
        widget.CPU(
            format=" {load_percent}%",
            foreground=colors["accent"],
            background=colors["background"],
            padding=6,
        ),

        #  RAM
        widget.Memory(
            format=" {MemUsed:.0f}{mm}",
            foreground=colors["accent"],
            background=colors["background"],
            padding=6,
        ),

        #  Głośność (klik = pavucontrol)
        widget.TextBox(
            text="",
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
            padding=8,
            foreground=colors["accent"],
            fontsize=16,
        ),

        # 󰄄 Screenshot (flameshot)
        widget.TextBox(
            text="󰄄",
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn("flameshot gui")},
            padding=8,
            foreground=colors["accent"],
            fontsize=16,
        ),

        # 🧪 Terminal (kitty)
        widget.TextBox(
            text="",
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn("kitty")},
            padding=8,
            foreground=colors["accent"],
            fontsize=16,
        ),

        # ⭘ Szybkie wyjście
        widget.QuickExit(
            default_text='⏻',
            countdown_format='[{}]',
            foreground=colors["inactive"],
            background=colors["background"],
            padding=8,
        ),
    ]
