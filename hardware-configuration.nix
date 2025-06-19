{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b48bf411-70a8-44d9-b75d-26e15edef6fe";
    fsType = "ext4"; # lub btrfs/xfs/zfs — zależnie od Twojego dysku
  };

  swapDevices = [ ]; # dodaj swap jeśli chcesz

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # NVIDIA specyficzne (w połączeniu z nvidia w configuration.nix)
  hardware.nvidia.modesetting.enable = true;
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Jeśli masz Wi-Fi przez kartę Intel/Realtek itp.
  hardware.enableRedistributableFirmware = true;
  hardware.firmware = [ pkgs.firmwareLinuxNonfree ];

  # Opcjonalnie: ustaw DPI dla Twojego monitora (ultrapanorama)
  # services.xserver.dpi = 110;
}
