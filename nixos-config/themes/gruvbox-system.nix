{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qt6ct
    kdePackages.qtstyleplugin-kvantum
    gruvbox-kvantum
    papirus-icon-theme
    bibata-cursors
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
    GTK_THEME = "Gruvbox-Dark-BL";
    GTK_ICON_THEME = "Papirus-Dark";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "chili";
}
