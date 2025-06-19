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

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.qtile.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.joek = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "networkmanager" ];
    initialPassword = "fog"; # zmień po instalacji!
  };

  programs.ssh.startAgent = true;
  system.stateVersion = "24.05";
}
