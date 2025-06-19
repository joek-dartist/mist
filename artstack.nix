{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    krita blender gimp inkscape mypaint
    dolphin alacritty rofi
    picom kvantum qt5ct qt6ct lxappearance
    ffmpeg vlc imagemagick
    git neofetch nano unzip
    nvidia-smi nvidia-settings
    pavucontrol helvum qjackctl
  ];

  system.activationScripts.createArtFolder = {
    text = ''
      mkdir -p /home/joek/ART/{projekty,eksporty,palety}
      chown -R joek:users /home/joek/ART
    '';
  };
}
