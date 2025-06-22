{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    krita        # cyfrowe malowanie
    mypaint      # lekki rysownik z wsparciem tabletu
    gimp         # edycja rastrowa (Photoshop open source)
    darktable    # obróbka RAW (jak Lightroom)
    blender      # 3D modeling i animacja
    obs-studio   # nagrywanie / streaming
    vlc          # odtwarzacz audio/wideo
    inkscape     # edycja wektorowa SVG
  ];
}
