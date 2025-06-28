from libqtile import layout
from libqtile.config import Match
from colors import colors

def init_layouts():
    return [
        layout.Max(),
        layout.Floating(
            border_focus="#d79921",
            border_normal="#3c3836",
            border_width=2
        ),
        layout.Columns(
            border_focus="#b8bb26",
            border_normal="#504945",
            border_width=2,
            margin=6
        ),
        layout.MonadTall(
            border_focus="#83a598",
            border_normal="#3c3836",
            border_width=2,
            margin=6
        )
    ]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(title='branchdialog'),
        Match(wm_class='ssh-askpass')
    ],
    border_focus=colors["accent"]
)
