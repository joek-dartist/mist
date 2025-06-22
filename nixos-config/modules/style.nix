{ config, lib, pkgs, style ? "gruvbox", ... }:

let
  styles = {
    gruvbox = import ../themes/gruvbox-system.nix;
    # Możesz dodać więcej np.:
    # tokyonight = import ../themes/tokyonight.nix;
  };
in

styles.${style} { inherit pkgs; }
