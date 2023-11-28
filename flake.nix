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
    
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
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

  outputs = {
    nixpkgs,
    home-manager,
    hyprland-contrib,
    self,
    ...
  } @ inputs: {
    # outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      banana-pc = nixpkgs.lib.nixosSystem {
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

      banana-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/laptop
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
