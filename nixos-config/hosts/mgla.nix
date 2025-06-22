{ config, pkgs, ... }: {
  networking.hostName = "mgla";
  time.timeZone = "Europe/Warsaw";

  users.users.joek = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "networkmanager" "audio" ];
    shell = pkgs.fish;
  };
  
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false; # ← używamy zamkniętych (proprietary) sterowników
  hardware.nvidia.nvidiaSettings = true;
    
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  
  
  system.stateVersion = "25.05";
}
