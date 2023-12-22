{
  inputs,
  isNixOS,
  lib,
  ...
}: let
  mkHost = host: let
    extraSpecialArgs = {
      inherit inputs host isNixOS;
    };
    homeManagerImports = [
      ./${host}/home.nix # host specific home-manager configuration
      ../home
      ../options/home
    ];
  in
    if isNixOS
    then
      lib.nixosSystem {
        specialArgs = extraSpecialArgs;

        modules = [
          ./${host} # host specific configuration
          ./${host}/hardware-configuration.nix # host specific hardware configuration
          ../modules
          ../pkgs
          ../options/nixos
          inputs.nur.nixosModules.nur
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              inherit extraSpecialArgs;

              users.banana = {
                imports = homeManagerImports;
                programs.home-manager.enable = true;
              };
            };
          }
          # alias for home-manager
          (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" "banana"])
        ];
      }
    else
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit extraSpecialArgs;

        pkgs = import inputs.nixpkgs {
          config.allowUnfree = true;
        };
        modules = homeManagerImports;
      };
in
  builtins.listToAttrs (map (host: {
    name = "banana-${host}";
    value = mkHost host;
  }) ["pc" "laptop" "server"])
