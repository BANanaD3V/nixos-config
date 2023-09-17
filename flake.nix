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

    hyprland-desktop-portal = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };
    catppuccinifier = {
      url = "github:lighttigerXIV/catppuccinifier";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, spicetify-nix, home-manager, hyprland-contrib, hyprland, hyprland-desktop-portal, catppuccinifier, ... }: {
    nixosConfigurations = {
      # TODO please change the hostname to your own
      banana-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./modules
 	  #./gtk.nix
          #./test.nix
	  #./spicetify.nix
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace ryan with your own username
            home-manager.users.banana = {
              imports = [
                ./home.nix
		#./flameshot
                #./spicetify.nix
		#./spicetify.nix
              ];
            };

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
            home-manager.extraSpecialArgs = {
              inherit inputs hyprland-contrib;
	      inherit nixpkgs catppuccinifier;
	    };
          }
        ];
      };
    };
  };
}
