{ config, lib, pkgs, ... }:

let
  kernelChoice = config._module.args.kernel or "zen";
  kernels = {
    zen = pkgs.linuxPackages_zen;
    latest = pkgs.linuxPackages_latest;
    lqx = pkgs.linuxPackages_lqx;
    hardened = pkgs.linuxPackages_hardened;
  };
in {
   boot.kernelPackages = assert builtins.hasAttr kernelChoice kernels 
   || throw "Nieznany kernel: ${kernelChoice}. Dostępne: ${builtins.attrNames kernels}";
   kernels.${kernelChoice};
}

