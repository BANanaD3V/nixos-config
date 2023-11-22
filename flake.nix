{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    xdg-desktop-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
    };

    spicetify-nix = {
      url = "github:MichaelPachec0/spicetify-nix";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
    };
  };

  outputs = { nixpkgs, home-manager, hyprland-contrib, self, ... }@inputs: {
  # outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # TODO please change the hostname to your own
      banana-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./hosts/pc
          ./modules/base.nix
          ./modules/greetd.nix
          ./modules/steam.nix
          ./pkgs
         home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
	          };
          }
        ];
      };
    };
  };
}
