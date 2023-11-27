{ inputs, pkgs, ... }: {
  flake.nixosConfigurations = {
    # TODO please change the hostname to your own
    banana-pc = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = inputs;
      modules = [
        ./pc
        ./modules/base.nix
        ./modules/steam.nix
        ./pkgs
        ];
      home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    };
  };
}
