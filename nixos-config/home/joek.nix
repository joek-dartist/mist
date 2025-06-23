{ config, pkgs, ... }: {
  home.username = "joek";
  home.homeDirectory = "/home/joek";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [ neofetch xclip unzip ];

  programs.fish.enable = true;
  programs.starship.enable = true;

  xsession.enable = true;
  xsession.windowManager.command = "qtile";

  home.sessionVariables = {
    GTK_THEME = "Gruvbox-Dark-BL";
    QT_STYLE_OVERRIDE = "kvantum";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
