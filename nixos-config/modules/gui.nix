{ config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    layout = "pl";
    libinput.enable = true;

    displayManager.sddm.enable = true;
    windowManager.qtile.enable = true;
    videoDrivers = [ "nvidia" ];
  };

  environment.systemPackages = with pkgs; [
    python313Packages.qtile
    python313Packages.qtile-extras
    picom
    rofi
    alacritty
    kdePackages.dolphin
    kdePackages.kate
    kdePackages.kdeconnect-kde
  ];

  # Opcjonalnie można ustawić domyślną sesję SDDM
  services.displayManager.defaultSession = "qtile";

  # Jeśli chcesz uruchamiać coś przy starcie sesji — picom itd. —
  # można to dodać w home-managerze (dam w joek.nix później)
}
