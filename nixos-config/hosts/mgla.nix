{ config, pkgs, ... }: {
  networking.hostName = "mgla";
  time.timeZone = "Europe/Warsaw";

  users.users.joek = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "networkmanager" "audio" ];
    shell = pkgs.fish;
  };
  
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false; # ← używamy zamkniętych (proprietary) sterowników
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  system.stateVersion = "25.05";
}
