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

    hyprland.url = "github:hyprwm/Hyprland";

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };

    xdg-desktop-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    spicetify-nix.url = "github:MichaelPachec0/spicetify-nix";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nur.url = "github:nix-community/NUR";

    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
  commonInherits = {
      inherit (nixpkgs) lib;
      inherit self inputs nixpkgs;
    }; in {
    # outputs = { self, nixpkgs, ... }@inputs: {

    nixosConfigurations = import ./hosts (commonInherits);
  };
}
