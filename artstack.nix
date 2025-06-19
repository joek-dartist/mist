{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Artystyczne narzędzia
    krita blender gimp inkscape mypaint

    # Menedżer plików i terminal
    dolphin alacritty rofi

    # Kompozytor i styl
    picom kvantum qt5ct qt6ct

    # Media i dodatki
    vlc ffmpeg imagemagick

    # Narzędzia systemowe
    git neofetch nano unzip
    nvidia-smi nvidia-settings

    # Twoje aliasy mogą działać przez `~/.bashrc`
  ];

  # Utwórz katalog ~/ART na start
  system.activationScripts.createArtFolder = {
    text = ''
      mkdir -p /home/joek/ART/projekty /home/joek/ART/eksporty /home/joek/ART/palety
      chown -R joek:users /home/joek/ART
    '';
  };
}
