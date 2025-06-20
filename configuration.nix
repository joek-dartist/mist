{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./artstack.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mgla";
  networking.useDHCP = true;
  time.timeZone = "Europe/Warsaw";

  hardware.opengl.enable = true;

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;
    acceptLicense = true;
    modesetting.enable = true;
  };
  services.xserver.deviceSection = ''
  Option "Coolbits" "28"
  '';
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true; # (opcjonalnie dla DAW/kreatywnych setupów)
  };

  # Automatyczny menedżer sesji: WirePlumber
  services.pipewire.wireplumber.enable = true;

  users.users.joek = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "networkmanager" ];
    initialPassword = "fog"; # zmień po instalacji!
  };

  programs.ssh.startAgent = true;
  system.stateVersion = "24.05";
}
