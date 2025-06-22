{ config, pkgs, ... }: {
  home.username = "joek";
  home.homeDirectory = "/home/joek";
  home.stateVersion = "25.05"; # Dopasuj do systemu

  home.packages = with pkgs; [
    neofetch
    file
    unzip
    xclip
  ];

  programs.fish.enable = true;
  programs.starship.enable = true;

  xdg.enable = true;

  # Autostart stylu i kompozytora
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
    GTK_THEME = "Gruvbox-Dark-BL";
  };

  # Autostart dla sesji X (np. picom, qt6ct)
  xsession = {
    enable = true;
    windowManager.command = "qtile";
    initExtra = ''
      picom --config ${config.home.homeDirectory}/.config/picom/picom.conf &
      qt6ct &
      kvantum-manager &
    '';
  };

  # Tworzymy katalog ~/.config/picom z prostą konfiguracją mgły
  home.file.".config/picom/picom.conf".text = ''
    backend = "glx";
    vsync = true;
    corner-radius = 6;
    shadow = true;
    shadow-radius = 10;
    shadow-offset-x = -10;
    shadow-offset-y = -10;
    fade-in-step = 0.05;
    fade-out-step = 0.05;
    inactive-opacity = 0.92;
    active-opacity = 1.0;
    blur:
      {
        method = "dual_kawase";
        strength = 4;
      };
  '';
}
