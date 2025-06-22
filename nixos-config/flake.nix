{
  description = "FogOS — mglista dystrybucja Joeka";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.mgla = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hardware-configuration.nix
        ./hosts/mgla.nix

        ./modules/gui.nix
        ./modules/gaming.nix
        ./modules/audio.nix
        ./modules/apps.nix
        ./modules/shell.nix
        ./modules/style.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.joek = import ./home/joek.nix;
        }
      ];
    };
  };
}
