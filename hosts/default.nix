{
  inputs,
  lib,
  ...
}: let
  mkHost = host: let
    extraSpecialArgs = {
      inherit inputs;
    };
    homeManagerImports = [
      ./${host}/home.nix # host specific home-manager configuration
      ../home
      ../options/home
    ];
  in
    lib.nixosSystem {
      specialArgs = extraSpecialArgs;

      modules = [
        ./${host} # host specific configuration
        ./${host}/hardware-configuration.nix # host specific hardware configuration
        ../modules
        ../options/nixos
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

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
    };
in
  builtins.listToAttrs (map (host: {
    name = "banana-${host}";
    value = mkHost host;
  }) ["pc" "laptop"])
