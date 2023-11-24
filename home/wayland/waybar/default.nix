{
  pkgs,
  lib,
  config,
  inputs,
  default,
  ...
}:
with lib; let
  cfg = import ./config.nix {inherit config;};
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
    # package = inputs.waybar.packages.${pkgs.system}.default;
    settings = cfg;
    style = style;
  };
}
