{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    steam
    lutris
    discord
  ];

  # Upewniamy się, że wymagane rzeczy dla gier działają
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
