{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    steam
    lutris
    discord
  ];

  # Upewniamy się, że wymagane rzeczy dla gier działają
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
