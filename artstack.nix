{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.krita blender gimp inkscape mypaint
    kdePackages.dolphin
    alacritty rofi
    picom kdePackages.kvantum kdePackages.kvantum-manager
    qt6ct lxappearance
    ffmpeg vlc imagemagick
    git neofetch nano unzip
    nvidia-smi nvidia-settings
    pavucontrol helvum qjackctl
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
  };

  system.activationScripts.createArtFolder = {
    text = ''
      mkdir -p /home/joek/ART/{projekty,eksporty,palety}
      chown -R joek:users /home/joek/ART
    '';
  };
}
