{
  description = "FogOS — mglista dystrybucja Joeka";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
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
        ./modules/kernel.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.joek = import ./home/joek.nix;
        }
      ];

      specialArgs = {
        kernel = "zen";
        style = "gruvbox";
      };
    };

    homeConfigurations.joek = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      extraSpecialArgs = {
        style = "gruvbox";
      };

      sharedModules = [
        ./themes/gruvbox-home.nix
      ];

      modules = [
        ./home/joek.nix
      ];
    };
  };
}
