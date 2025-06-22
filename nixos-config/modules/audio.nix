{ config, pkgs, ... }: {
  # PipeWire – nowoczesny serwer audio z obsługą Pulse i Jack
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = false; # Można dać true jeśli używasz DAW
  };

  # Bluetooth – przez BlueZ + obsługa audio
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Pavucontrol – GUI do zarządzania głośnością i urządzeniami
  environment.systemPackages = with pkgs; [
    pavucontrol
    pulsemixer  # konsolowy mikser (opcjonalnie)
    blueman
  ];
}
