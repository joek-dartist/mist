{ config, pkgs, ... }: {
  xdg.enable = true;

  xdg.configFile."Kvantum/Gruvbox-Dark-BL.kvconfig".source =
    "${pkgs.gruvbox-kvantum}/share/Kvantum/Gruvbox-Dark-BL/Gruvbox-Dark-BL.kvconfig";

  xdg.configFile."wallpaper.jpg".source = ../wallpapers/gruvbox_forest.jpg;

  home.file.".config/rofi/config.rasi".text = ''@import "gruvbox-dark"'';

  home.file.".config/kitty/theme.conf".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/wdomitrz/kitty_gruvbox_theme/master/gruvbox_dark.conf";
    sha256 = "sha256-KTFlMLkVv4qObx//BJYzI0H2BipT3+lz2MRSVtTNaqQ=";
  };

  home.file.".config/kitty/kitty.conf".text = ''
    include ./theme.conf
    font_family      JetBrainsMono Nerd Font
    font_size        11
  '';

  home.file.".config/dunst/dunstrc".text = ''
    [global]
    frame_color = "#d79921"
    separator_color = "#3c3836"
    font = JetBrainsMono 10
  '';
}
