{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:MichaelPachec0/spicetify-nix";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    nvim-config = {
      url = "github:bananad3v/neovim";
      flake = false;
    };

    nixvim.url = "github:nix-community/nixvim";

    catppuccin-grub = {
      url = "github:catppuccin/grub";
      flake = false;
    };

    auto-cpufreq = {
      url = "github:adnanhodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = github:nix-community/NUR;

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    pre-commit-hooks,
    self,
    ...
  } @ inputs: let
    username = "BANana";
    userfullname = "Nikita";
    useremail = "bananadev@skiff.com";
    
    system = "x86_64-linux";

    commonInherits = {
      inherit (nixpkgs) lib;
      inherit self inputs nixpkgs;
    };
    eachSystem = object: (nixpkgs.lib.genAttrs [system] object);
  in {
    nixosConfigurations = import ./hosts (
      commonInherits // {isNixOS = true;}
    );

    homeConfigurations = import ./hosts (
      commonInherits // {isNixOS = false;}
    );

    checks = eachSystem (system: {
      pre-commit-check = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;
          statix = {
            enable = true;
            excludes = [".lock"];
          };
          prettier = {
            enable = false;
            excludes = [".md"];
          };
        };
      };
    });


  };
}
