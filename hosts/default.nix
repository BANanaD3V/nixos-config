{

}: {
  nixosConfigurations = {
      # TODO please change the hostname to your own
      banana-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./hosts/pc
          ./modules/base.nix
          ./modules/steam.nix
          ./pkgs
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace ryan with your own username
            # home-manager.users.banana = {
            #   imports = [
            #     ./home
            #   ];
            # };

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
            home-manager.extraSpecialArgs = {
              inherit inputs hyprland-contrib;
	            inherit nixpkgs catppuccinifier;
	          };
          }
        ];
      };
    };
}
