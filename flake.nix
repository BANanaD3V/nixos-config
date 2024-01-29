{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:the-argus/spicetify-nix";

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
    getchoo = {
      url = "github:getchoo/nix-exprs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    schizofox = {
    url = "github:schizofox/schizofox";
    };
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    username = "banana";
    userfullname = "Nikita";
    useremail = "bananadev@skiff.com";

    system = "x86_64-linux";

    commonInherits = {
      inherit (nixpkgs) lib;
      inherit self inputs;
      inherit username userfullname useremail;
      inherit system;
    };
    eachSystem = object: (nixpkgs.lib.genAttrs [system] object);
  in {
    nixosConfigurations = import ./hosts (
      commonInherits // {isNixOS = true;}
    );

    homeConfigurations = import ./hosts (
      commonInherits // {isNixOS = false;}
    );
  };
}
