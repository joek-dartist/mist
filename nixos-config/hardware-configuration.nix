{ config, lib, pkgs, modulesPath,  ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "kvm-amd" "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  security.lockKernelModules = false;
  
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1ed54239-8e4d-4f6f-a869-69e258cc5f50";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DE82-F39C";
    fsType = "vfat";
  };

  swapDevices = [ ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
