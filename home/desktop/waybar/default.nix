{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}:
with lib; let
  cfg = import ./config.nix {inherit lib config;};
  style = import ./style.nix;
in {
  home.file.".config/waybar/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  home.packages = with pkgs; [
    networkmanagerapplet
    blueman
  ];

  programs.waybar = {
    enable = true;
    # package = pkgs.waybar.overrideAttrs { src = pkgs.fetchFromGitHub {
    #   owner = "Alexays";
    #   rev = "1fe4a4ee9d2baed6d3c36d46eb6e1c39b67bce05";
    #   repo = "Waybar";
    #   hash = "sha256-vpW9M/vS35uJXz8bSoR50hM2yX/tVQpTnJJFkLtlEfs=";
    # };};
    settings = cfg;
    style = style;
  };
}
