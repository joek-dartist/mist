{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qt6ct
    kdePackages.qtstyleplugin-kvantum
    pkgs.themechanger
    gruvbox-kvantum
    lxappearance
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
    GTK_THEME = "Gruvbox-Dark-BL";
  };
}
