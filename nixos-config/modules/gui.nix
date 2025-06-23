{ config, pkgs, ... }: {
  services = {
    xserver.enable = true;
    xserver.xkb.layout = "pl";
    libinput.enable = true;

    displayManager.sddm.enable = true;
    xserver.windowManager.qtile.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
  };

  environment.systemPackages = with pkgs; [
    python313Packages.qtile
    python313Packages.qtile-extras
    python313Packages.cairocffi
    python313Packages.xcffib
    picom
    rofi
    alacritty
    kitty
    kdePackages.dolphin
    kdePackages.kate
    kdePackages.kdeconnect-kde
  ];

  # Opcjonalnie można ustawić domyślną sesję SDDM
  services.displayManager.defaultSession = "qtile";

  # Jeśli chcesz uruchamiać coś przy starcie sesji — picom itd. —
  # można to dodać w home-managerze (dam w joek.nix później)
}
